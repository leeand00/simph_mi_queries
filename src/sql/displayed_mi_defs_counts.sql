
(
SELECT /*TOP 10 [ObjectNumber], mid.[MenuItemClassObjNum], [MainLvl],[SubLvl], SluGroupNum */ 'DRAFTHOUSE' AS RVC,  'TOTAL' AS SUB_RVC_WITHIN_MIs, count(*) AS NUM_DEF_RECS
  FROM ([dbo].[MENU_ITEM_MASTER] mim INNER JOIN [dbo].[MENU_ITEM_DEFINITION] mid ON mid.MenuItemMasterID = mim.MenuItemMasterID) 
	
  WHERE mim.HierStrucID IN (1) AND /* Enterprise Level */
   ((mim.ObjectNumber BETWEEN 23100000 AND 23199999) OR 
    (mim.ObjectNumber BETWEEN 27100000 AND 27199999) OR 
    (mim.ObjectNumber BETWEEN 27200000 AND 27299999) 
   ) AND mid.HierStrucID = 32
   AND MainLvl = '11111111' AND SubLvl = '11111111' AND SluIndex IS NOT NULL

) UNION ALL (

/* 394 - Prices for 331 */
SELECT /*TOP 10 [ObjectNumber], mid.[MenuItemClassObjNum], [MainLvl],[SubLvl], SluGroupNum */ 'EATERY' AS RVC,  'TOTAL' AS SUB_RVC_WITHIN_MIs, count(*) AS NUM_DEF_RECS
  FROM ([dbo].[MENU_ITEM_MASTER] mim INNER JOIN [dbo].[MENU_ITEM_DEFINITION] mid ON mid.MenuItemMasterID = mim.MenuItemMasterID) 
	
  WHERE mim.HierStrucID IN (1) AND /* Enterprise Level */
   ((mim.ObjectNumber BETWEEN 23100000 AND 23199999) OR 
    (mim.ObjectNumber BETWEEN 27100000 AND 27199999) OR
    (mim.ObjectNumber BETWEEN 27200000 AND 27299999) 
   ) AND mid.HierStrucID = 25
   AND MainLvl = '11111111' AND SubLvl = '11111111' AND SluIndex IS NOT NULL
) UNION ALL (

 SELECT /*TOP 10 [ObjectNumber], mid.[MenuItemClassObjNum], [MainLvl],[SubLvl], SluGroupNum */ 'EATERY' AS RVC,  LEFT(mim.ObjectNumber, 3) AS SUB_RVC_WITHIN_MIs, count(*) AS NUM_DEF_RECS
  FROM ([dbo].[MENU_ITEM_MASTER] mim INNER JOIN [dbo].[MENU_ITEM_DEFINITION] mid ON mid.MenuItemMasterID = mim.MenuItemMasterID) 
	
  WHERE mim.HierStrucID IN (1) AND /* Enterprise Level */
   ((mim.ObjectNumber BETWEEN 23100000 AND 23199999) OR 
    (mim.ObjectNumber BETWEEN 27100000 AND 27199999) OR
    (mim.ObjectNumber BETWEEN 27200000 AND 27299999) 
   ) AND mid.HierStrucID = 25 
     AND MainLvl = '11111111' AND SubLvl = '11111111' AND SluIndex IS NOT NULL
     GROUP BY LEFT(mim.ObjectNumber, 3)
 ) UNION ALL (
 SELECT /*TOP 10 [ObjectNumber], mid.[MenuItemClassObjNum], [MainLvl],[SubLvl], SluGroupNum */ 'DRAFTHOUSE' AS RVC,  LEFT(mim.ObjectNumber, 3) AS SUB_RVC_WITHIN_MIs, count(*) AS NUM_DEF_RECS
  FROM ([dbo].[MENU_ITEM_MASTER] mim INNER JOIN [dbo].[MENU_ITEM_DEFINITION] mid ON mid.MenuItemMasterID = mim.MenuItemMasterID) 
	
  WHERE mim.HierStrucID IN (1) AND /* Enterprise Level */
   ((mim.ObjectNumber BETWEEN 23100000 AND 23199999) OR 
    (mim.ObjectNumber BETWEEN 27100000 AND 27199999) OR
    (mim.ObjectNumber BETWEEN 27200000 AND 27299999) 
   ) AND mid.HierStrucID = 32 
   AND MainLvl = '11111111' AND SubLvl = '11111111' AND SluIndex IS NOT NULL

   GROUP BY LEFT(mim.ObjectNumber, 3)

)
