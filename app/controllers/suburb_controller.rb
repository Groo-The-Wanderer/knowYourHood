class SuburbController < ApplicationController
  def search
    results = Suburb.where name: params[:suburb]
    render({
      json: results,
      status: :ok,
      include: {
        snapshot: { except: [:id, :abs_ssc, :created_at, :updated_at] },
        family: { except: [:id, :abs_ssc, :created_at, :updated_at] },
        dwelling: { except: [:id, :abs_ssc, :created_at, :updated_at] },
        dwelling: { except: [:id, :abs_ssc, :created_at, :updated_at] },
        homeownership: { except: [:id, :abs_ssc, :created_at, :updated_at] }
      }
    })
  end
end
