module Responsible
  extend ActiveSupport::Concern

  included do
    respond_to :json
  end

  def index_template
    current_user.send(model.pluralize.to_s)
  end

  def show_template
    respond_with *namespaces, record
  end

  def create_template
    respond_with *namespaces, model.create(permitted_params)
  end

  def update_template
    respond_with *namespaces, record.update(permitted_params)
  end

  def destroy_template
    respond_with *namespaces, record.destroy
  end

  private

  def api_controller_name
    self.class.name.demodulize.sub('Controller', '')
  end

  def permitted_params
    params.require(symbolized_model).permit(self.class.permitted_param_keys)
  end

  def association_name
    api_controller_name.pluralize
  end

  def symbolized_model
    api_controller_name.singularize.underscore.to_sym
  end

  def model
    api_controller_name.classify.constantize
  end

  def record
    @_record ||= begin
      record = model.find(params[:id])
      assert_permissions! record
      record
    end
  end

  def namespaces
    self.class.name.split('::').delete_if do |str|
      str.include?('Controller')
    end.map { |str| str.downcase.to_sym }
  end

  def assert_permissions!(record)
    raise ActiveRecord::RecordNotFound unless record.owner == current_user
  end

  module ClassMethods
    def actions(*args)
      args.each do |method|
        define_method(method) do
          send("#{method}_template")
        end
      end
    end

    def permit(*args)
      self.class_attribute :permitted_param_keys
      self.permitted_param_keys = args
    end
  end

end
