import 'package:floor/floor.dart';
import 'package:seccai/data/model/listing_model.dart';

@dao
abstract class ListingDao {
  @Query('SELECT * FROM listing')
  Future<List<ListingModel>> findAllListings();

  @Query('SELECT * FROM listing WHERE id = :id')
  Future<ListingModel?> findListingById(String id);

  @insert
  Future<void> insertListing(ListingModel task);

  @update
  Future<void> updateListing(ListingModel task);
}
