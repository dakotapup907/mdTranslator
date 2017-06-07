# sbJson 1.0 writer

# History:
#  Stan Smith 2017-05-26 original script

module ADIWG
   module Mdtranslator
      module Writers
         module SbJson

            module Codelists

               @iso_sb_role = [
                  {iso: 'resourceProvider', sb: 'Resource Provider'},
                  {iso: 'custodian', sb: 'Custodian'},
                  {iso: 'rightsHolder', sb: 'Data Owner'},
                  {iso: 'use', sb: 'User'},
                  {iso: 'distributor', sb: 'Distributor'},
                  {iso: 'originator', sb: 'Originator'},
                  {iso: 'pointOfContact', sb: 'Point of Contact'},
                  {iso: 'principalInvestigator', sb: 'Principal Investigator'},
                  {iso: 'processor', sb: 'Processor'},
                  {iso: 'author', sb: 'Author'},
                  {iso: 'coAuthor', sb: 'Author'},
                  {iso: 'collaborator', sb: 'Cooperator/Partner'},
                  {iso: 'contributor', sb: 'Cooperator/Partner'},
                  {iso: 'editor', sb: 'Editor'},
                  {iso: 'coPrincipalInvestigator', sb: 'Co-Investigator'},
                  {iso: 'publisher', sb: 'publisher'},
                  {iso: 'sponsor', sb: 'sponsor'},
                  {iso: 'stakeholder', sb: 'stakeholder'},
                  {iso: 'administrator', sb: 'administrator'},
                  {iso: 'client', sb: 'client'},
                  {iso: 'logistics', sb: 'logistics'},
                  {iso: 'mediator', sb: 'mediator'}
               ]

               @iso_sb_onlineFunction = [
                  {iso: 'information', sb: 'webLink'},
                  {iso: 'completeMetadata', sb: 'originalMetadata'},
                  {iso: 'browseGraphic', sb: 'browseImage'},
                  {iso: 'webApplication', sb: 'webapp'},
                  {iso: 'download', sb: 'download'},
                  {iso: 'offlineAccess', sb: 'offlineAccess'},
                  {iso: 'order', sb: 'order'},
                  {iso: 'search', sb: 'search'},
                  {iso: 'upload', sb: 'upload'},
                  {iso: 'emailService', sb: 'emailService'},
                  {iso: 'browsing', sb: 'browsing'},
                  {iso: 'fileAccess', sb: 'fileAccess'}
               ]

               @iso_sb_scope = [
                  {iso: 'collectionHardware', sb: 'Collection'},
                  {iso: 'collectionSession', sb: 'Collection'},
                  {iso: 'dataset', sb: 'Data'},
                  {iso: 'document', sb: 'Document'},
                  {iso: 'collection', sb: 'Collection'},
                  {iso: 'application', sb: 'Application'},
                  {iso: 'sciencePaper', sb: 'Report'},
                  {iso: 'project', sb: 'Project'},
                  {iso: 'map', sb: 'Data'},
                  {iso: 'photographicImage', sb: 'Image'},
                  {iso: 'publication', sb: 'Publication'},
                  {iso: 'tabularDataset', sb: 'Data'},
                  {iso: 'report', sb: 'Report'},
                  {iso: 'sample', sb: 'Physical Item'},
                  {iso: 'attribute', sb: nil},
                  {iso: 'attributeType', sb: nil},
                  {iso: 'series', sb: nil},
                  {iso: 'nonGeographicDataset', sb: nil},
                  {iso: 'dimensionGroup', sb: nil},
                  {iso: 'feature', sb: nil},
                  {iso: 'featureType', sb: nil},
                  {iso: 'propertyType', sb: nil},
                  {iso: 'fieldSession', sb: nil},
                  {iso: 'software', sb: nil},
                  {iso: 'model', sb: nil},
                  {iso: 'tile', sb: nil},
                  {iso: 'metadata', sb: nil},
                  {iso: 'repository', sb: nil},
                  {iso: 'aggregate', sb: nil},
                  {iso: 'product', sb: nil},
                  {iso: 'coverage', sb: nil},
                  {iso: 'userGuide', sb: nil},
                  {iso: 'dataDictionary', sb: nil},
                  {iso: 'website', sb: nil},
                  {iso: 'publication', sb: nil},
                  {iso: 'awardInfo', sb: nil},
                  {iso: 'collectionSite', sb: nil},
                  {iso: 'factSheet', sb: nil},
                  {iso: 'drawing', sb: nil},
                  {iso: 'presentation', sb: nil}
               ]

               @iso_sb_date = [
                  {iso: 'creation', sb: 'Creation'},
                  {iso: 'publication', sb: 'Publication'},
                  {iso: 'revision', sb: 'Revision'},
                  {iso: 'expiry', sb: nil},
                  {iso: 'lastUpdate', sb: 'lastUpdate'},
                  {iso: 'lastRevision', sb: 'lastRevision'},
                  {iso: 'nextUpdate', sb: 'nextUpdate'},
                  {iso: 'unavailable', sb: 'unavailable'},
                  {iso: 'inForce', sb: 'inForce'},
                  {iso: 'adopted', sb: 'adopted'},
                  {iso: 'deprecated', sb: 'deprecated'},
                  {iso: 'suspended', sb: 'suspended'},
                  {iso: 'validityBegins', sb: 'validityBegins'},
                  {iso: 'validityExpires', sb: 'validityExpires'},
                  {iso: 'released', sb: 'Release'},
                  {iso: 'distribution', sb: 'date identifiers when an instance of the resource was distributed'}
               ]

               @iso_sb_progress = [
                  {iso: 'completed', sb: 'Completed'},
                  {iso: 'historicalArchive', sb: nil},
                  {iso: 'obsolete', sb: nil},
                  {iso: 'onGoing', sb: 'In Progress'},
                  {iso: 'onGoing', sb: 'Active'},
                  {iso: 'planned', sb: nil},
                  {iso: 'required', sb: nil},
                  {iso: 'underDevelopment', sb: nil},
                  {iso: 'final', sb: nil},
                  {iso: 'pending', sb: nil},
                  {iso: 'retired', sb: nil},
                  {iso: 'superseded', sb: nil},
                  {iso: 'tentative', sb: nil},
                  {iso: 'valid', sb: nil},
                  {iso: 'accepted', sb: 'Approved'},
                  {iso: 'notAccepted', sb: nil},
                  {iso: 'withdrawn', sb: nil},
                  {iso: 'proposed', sb: 'Proposed'},
                  {iso: 'deprecated', sb: nil},
                  {iso: 'funded', sb: nil},
                  {iso: 'cancelled', sb: nil},
                  {iso: 'suspended', sb: nil}
               ]

                  def self.codelist_iso_to_sb(codelist, isoCode: nil, sbCode: nil)

                  codeList = instance_variable_get("@#{codelist}")

                  unless isoCode.nil?
                     codeList.each do |obj|
                        if obj[:iso] == isoCode
                           return obj[:sb]
                        end
                     end
                  end

                  unless sbCode.nil?
                     codeList.each do |obj|
                        if obj[:sb] == sbCode
                           return obj[:iso]
                        end
                     end
                  end

                  # not found
                  return nil

               end

            end

         end
      end
   end
end