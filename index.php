<?php
$mysqli = mysqli_connect('127.0.0.1', 'root', null, 'tdna2');
if (mysqli_connect_errno()) {
  echo "Не удалось подключиться к MySQL: " . mysqli_connect_error();
}
// 1 Для заданного списка товаров получить названия всех категорий, в которых представлены товары;

// SELECT DISTINCT id, name FROM category 
// LEFT JOIN product_to_category  ON product_to_category.category_id = category.id
// WHERE product_to_category.product_id IN(3,5,7)

// 2 Для заданной категории получить список предложений всех товаров из этой категории и ее дочерних категорий;
function products($id, $connection, $data=null, $level = 0) {
  $val = $data?implode(',',$data[$level-1]):$id;
  $q = "SELECT * FROM category WHERE parent_id IN(".$val.")";
  $query = mysqli_query($connection,$q);

  $rowCnt = mysqli_num_rows($query);
  if ($rowCnt > 0) 
  {
    $i=0;
    while ($row = mysqli_fetch_assoc($query)) {
      $data[$level][$i] = $row['id'];
      $i++;
    }
    $level++;
    products($id, $connection, $data, $level++);
  } else {
    if(!$data) {
      $catList = $id;
    } else {
      $catList = []; 
      for($i=0; $i < count($data); $i++) {
        $catList[] .= implode(',',$data[$i]);
      }
      $catList = $id.','.implode(',' ,$catList);
    }
    $q = "SELECT id,name,price FROM product 
          JOIN product_to_category 
          ON product.id = product_to_category.product_id 
          WHERE product_to_category.category_id IN(".$catList.")";
    $query = mysqli_query($connection,$q);
    $fetchData = mysqli_fetch_all($query);
    var_dump($fetchData);
  }
}
# RESULT
//products(20, $mysqli);

// 3 Для заданного списка категорий получить количество предложений товаров в каждой категории;

// SELECT category_id, COUNT(product_id) FROM product_to_category
// WHERE category_id IN(14,17,24) GROUP BY category_id

// 4 Для заданного списка категорий получить общее количество уникальных предложений товара;

// $q = "SELECT COUNT(DISTINCT(product.id)) FROM product LEFT JOIN product_to_category ON product_to_category.product_id = product.id WHERE product_to_category.category_id IN(29, 7, 17,18,14)";//1,1,2,2,2

// 5 BREADCRUMPS
function breacrump($id, $connection,$data=null) {
  $q = "SELECT * FROM category WHERE id = ".$id;
  $query = mysqli_query($connection,$q);
  $fetchData = mysqli_fetch_assoc($query);
  if($fetchData['parent_id'] <= 0) {
    $data[] = $fetchData['name'];
    $data = array_reverse($data);
    $result = implode('/', $data);
    echo($result);
  } else {
    $data[] = $fetchData['name'];
    breacrump($fetchData['parent_id'], $connection, $data);
  }
}
#RESULT
//breacrump(29, $mysqli);

//=============== 3 TASK ====================
highlight_file('index.php');

mysqli_close($mysqli);