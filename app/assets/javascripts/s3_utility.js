
  function update_file_from_s3_results(data){
    var $r  = $(data.result),
        file   = data.files[0],
        bucket = $r.find('Bucket').text(),
        key    = $r.find('Key').text();

    file['location'] = decodeURIComponent($r.find('Location').text());
    file['key'] = key;
    file['etag'] = $r.find('ETag').text().replace(/\"/g,"");
    file['bucket'] = bucket;
    file['url'] = "http://" + bucket + "/" + key;
    return file;
  }

