# frozen_string_literal: true
class TTaxasController < ApplicationController
  before_action :set_t_taxa, only: %i[show edit update destroy]

  rescue_from ActiveRecord::RecordNotFound, with: :handle_not_found

  def index
    @q = TTaxa.ransack(params[:q])
    @pagy, @t_taxas = pagy(@q.result)
  end

  def new
    @t_taxa = TTaxa.new
  end

  def edit
  end

  def create
    @t_taxa = TTaxa.new(t_taxa_params)

    if @t_taxa.save
      redirect_to t_taxas_path, notice: t('messages.created_successfully')
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @t_taxa.update(t_taxa_params)
      redirect_to t_taxas_path, notice: t('messages.updated_successfully'), status: :see_other
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    if @t_taxa.destroy
      redirect_to t_taxas_url, notice: t('messages.deleted_successfully')
    else
      redirect_to t_taxas_url, alert: t('messages.delete_failed_due_to_dependencies')
    end   
  end

  private

  def set_t_taxa
    @t_taxa = TTaxa.find_by(id: params[:id])
    return redirect_to t_taxas_path, alert: t('messages.not_found') unless @t_taxa
  end

  def t_taxa_params
    permitted_attributes = TTaxa.column_names.reject { |col| ['deleted_at', 'created_by', 'updated_by'].include?(col) }
    params.require(:t_taxa).permit(permitted_attributes.map(&:to_sym))
  end

  def handle_not_found
    redirect_to t_taxas_path, alert: t('messages.not_found')
  end
end
