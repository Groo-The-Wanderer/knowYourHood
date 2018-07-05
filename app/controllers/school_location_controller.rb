class SchoolLocationController < ApplicationController
  def near
    # sw_corner = [-34.05573086013141, 150.87924564003595]
    # ne_corner = [-33.60854631431614, 151.47929605213164]
    # schools_nearby = SchoolLocation.within_bounding_box([params[:sw_lat], params[:sw_lng], params[:ne_lat], params[:ne_lng]])

    # return schools within a specified radius of the searched point
    schools_nearby = SchoolLocation.near([params[:lat], params[:lng]], params[:proximity])
    render({
      json: schools_nearby,
      status: :ok,
      except: [ :id, :created_at, :updated_at ],
      include: {
        school_profile: { except: [ :id, :school_id, :name, :suburb, :postcode, :state, :sector, :school_type, :created_at, :updated_at ] }
      }
    })
  end
end
