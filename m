Return-Path: <linux-doc+bounces-535-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B61B17CE3EA
	for <lists+linux-doc@lfdr.de>; Wed, 18 Oct 2023 19:07:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D892F1C20E13
	for <lists+linux-doc@lfdr.de>; Wed, 18 Oct 2023 17:07:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C47083D3B4;
	Wed, 18 Oct 2023 17:07:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Z4wijTw0"
X-Original-To: linux-doc@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BED33C086;
	Wed, 18 Oct 2023 17:07:25 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 927101AA;
	Wed, 18 Oct 2023 10:07:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697648838; x=1729184838;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=I3rOegVGbxcUy2S8NDVFJVbfIfe5oaqEs0oyUdHKVIw=;
  b=Z4wijTw0dmI2bSNsdMizducWjRDlD9hfE+ESSX+rmK2J+RENZbUMjN2a
   F4nKZbI+B3JOJbyUgO6iORh6xZX1tJtK6ZtLy8MZREa2qYX/peTcSKjFG
   fnOrCxiprpx2cth+xmrZXgrT3aWtEklq0ZXmDr6gg2aZ0Q9sIk0uHabw4
   i/UJhwWpgpK4ze077zA6eAHRF/ut0AVfu2CR7PQAzfR5qYcbVbYD71TQ2
   eb4QiH1mJsaWBtV0B9jzfkizQKk/bho7LhI9SxCkw5rCsACi3mJCBbJcq
   yDoFQWJMpjA5yypnSzZpQULxMOVukedM3eZbPEGGlBkMlyG3w07BaZEZw
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10867"; a="388925010"
X-IronPort-AV: E=Sophos;i="6.03,235,1694761200"; 
   d="scan'208";a="388925010"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Oct 2023 10:07:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10867"; a="822494211"
X-IronPort-AV: E=Sophos;i="6.03,235,1694761200"; 
   d="scan'208";a="822494211"
Received: from nirmoyda-mobl.ger.corp.intel.com (HELO azaki-desk1.intel.com) ([10.249.38.47])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Oct 2023 10:07:09 -0700
From: Ahmed Zaki <ahmed.zaki@intel.com>
To: netdev@vger.kernel.org
Cc: intel-wired-lan@lists.osuosl.org,
	corbet@lwn.net,
	jesse.brandeburg@intel.com,
	anthony.l.nguyen@intel.com,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	vladimir.oltean@nxp.com,
	andrew@lunn.ch,
	horms@kernel.org,
	mkubecek@suse.cz,
	willemdebruijn.kernel@gmail.com,
	linux-doc@vger.kernel.org,
	Ahmed Zaki <ahmed.zaki@intel.com>,
	Dan Nowlin <dan.nowlin@intel.com>,
	Wojciech Drewek <wojciech.drewek@intel.com>
Subject: [PATCH net-next v5 4/6] ice: refactor the FD and RSS flow ID generation
Date: Wed, 18 Oct 2023 11:06:33 -0600
Message-Id: <20231018170635.65409-5-ahmed.zaki@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231018170635.65409-1-ahmed.zaki@intel.com>
References: <20231018170635.65409-1-ahmed.zaki@intel.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,
	SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

The flow director and RSS blocks use separate methods to generate a
unique 64 bit ID for the flow. This is not extendable, especially for
the RSS that already uses all 64 bit space.

Refactor the flow generation API so that the ID is generated within
ice_flow_add_prof(). The FD and RSS blocks caches the generated ID for
later use.

Suggested-by: Dan Nowlin <dan.nowlin@intel.com>
Reviewed-by: Wojciech Drewek <wojciech.drewek@intel.com>
Signed-off-by: Ahmed Zaki <ahmed.zaki@intel.com>
---
 .../net/ethernet/intel/ice/ice_ethtool_fdir.c | 31 +++++-------
 .../net/ethernet/intel/ice/ice_flex_pipe.c    | 10 ++++
 .../net/ethernet/intel/ice/ice_flex_type.h    |  6 +++
 drivers/net/ethernet/intel/ice/ice_flow.c     | 47 +++++--------------
 drivers/net/ethernet/intel/ice/ice_flow.h     |  2 +-
 drivers/net/ethernet/intel/ice/ice_main.c     |  5 +-
 drivers/net/ethernet/intel/ice/ice_type.h     |  1 +
 .../ethernet/intel/ice/ice_virtchnl_fdir.c    | 33 ++++---------
 8 files changed, 54 insertions(+), 81 deletions(-)

diff --git a/drivers/net/ethernet/intel/ice/ice_ethtool_fdir.c b/drivers/net/ethernet/intel/ice/ice_ethtool_fdir.c
index 8c6e13f87b7d..c9c72f8dbcb2 100644
--- a/drivers/net/ethernet/intel/ice/ice_ethtool_fdir.c
+++ b/drivers/net/ethernet/intel/ice/ice_ethtool_fdir.c
@@ -302,9 +302,7 @@ void ice_fdir_rem_adq_chnl(struct ice_hw *hw, u16 vsi_idx)
 			continue;
 
 		for (tun = 0; tun < ICE_FD_HW_SEG_MAX; tun++) {
-			u64 prof_id;
-
-			prof_id = flow + tun * ICE_FLTR_PTYPE_MAX;
+			u64 prof_id = prof->prof_id[tun];
 
 			for (i = 0; i < prof->cnt; i++) {
 				if (prof->vsi_h[i] != vsi_idx)
@@ -362,10 +360,9 @@ ice_fdir_erase_flow_from_hw(struct ice_hw *hw, enum ice_block blk, int flow)
 		return;
 
 	for (tun = 0; tun < ICE_FD_HW_SEG_MAX; tun++) {
-		u64 prof_id;
+		u64 prof_id = prof->prof_id[tun];
 		int j;
 
-		prof_id = flow + tun * ICE_FLTR_PTYPE_MAX;
 		for (j = 0; j < prof->cnt; j++) {
 			u16 vsi_num;
 
@@ -439,12 +436,10 @@ void ice_fdir_replay_flows(struct ice_hw *hw)
 		for (tun = 0; tun < ICE_FD_HW_SEG_MAX; tun++) {
 			struct ice_flow_prof *hw_prof;
 			struct ice_fd_hw_prof *prof;
-			u64 prof_id;
 			int j;
 
 			prof = hw->fdir_prof[flow];
-			prof_id = flow + tun * ICE_FLTR_PTYPE_MAX;
-			ice_flow_add_prof(hw, ICE_BLK_FD, ICE_FLOW_RX, prof_id,
+			ice_flow_add_prof(hw, ICE_BLK_FD, ICE_FLOW_RX,
 					  prof->fdir_seg[tun], TNL_SEG_CNT(tun),
 					  &hw_prof);
 			for (j = 0; j < prof->cnt; j++) {
@@ -454,7 +449,7 @@ void ice_fdir_replay_flows(struct ice_hw *hw)
 
 				prio = ICE_FLOW_PRIO_NORMAL;
 				err = ice_flow_add_entry(hw, ICE_BLK_FD,
-							 prof_id,
+							 hw_prof->id,
 							 prof->vsi_h[0],
 							 prof->vsi_h[j],
 							 prio, prof->fdir_seg,
@@ -464,6 +459,7 @@ void ice_fdir_replay_flows(struct ice_hw *hw)
 						flow);
 					continue;
 				}
+				prof->prof_id[tun] = hw_prof->id;
 				prof->entry_h[j][tun] = entry_h;
 			}
 		}
@@ -630,7 +626,6 @@ ice_fdir_set_hw_fltr_rule(struct ice_pf *pf, struct ice_flow_seg_info *seg,
 	u64 entry1_h = 0;
 	u64 entry2_h = 0;
 	bool del_last;
-	u64 prof_id;
 	int err;
 	int idx;
 
@@ -678,23 +673,23 @@ ice_fdir_set_hw_fltr_rule(struct ice_pf *pf, struct ice_flow_seg_info *seg,
 	 * That is the final parameters are 1 header (segment), no
 	 * actions (NULL) and zero actions 0.
 	 */
-	prof_id = flow + tun * ICE_FLTR_PTYPE_MAX;
-	err = ice_flow_add_prof(hw, ICE_BLK_FD, ICE_FLOW_RX, prof_id, seg,
+	err = ice_flow_add_prof(hw, ICE_BLK_FD, ICE_FLOW_RX, seg,
 				TNL_SEG_CNT(tun), &prof);
 	if (err)
 		return err;
-	err = ice_flow_add_entry(hw, ICE_BLK_FD, prof_id, main_vsi->idx,
+	err = ice_flow_add_entry(hw, ICE_BLK_FD, prof->id, main_vsi->idx,
 				 main_vsi->idx, ICE_FLOW_PRIO_NORMAL,
 				 seg, &entry1_h);
 	if (err)
 		goto err_prof;
-	err = ice_flow_add_entry(hw, ICE_BLK_FD, prof_id, main_vsi->idx,
+	err = ice_flow_add_entry(hw, ICE_BLK_FD, prof->id, main_vsi->idx,
 				 ctrl_vsi->idx, ICE_FLOW_PRIO_NORMAL,
 				 seg, &entry2_h);
 	if (err)
 		goto err_entry;
 
 	hw_prof->fdir_seg[tun] = seg;
+	hw_prof->prof_id[tun] = prof->id;
 	hw_prof->entry_h[0][tun] = entry1_h;
 	hw_prof->entry_h[1][tun] = entry2_h;
 	hw_prof->vsi_h[0] = main_vsi->idx;
@@ -711,7 +706,7 @@ ice_fdir_set_hw_fltr_rule(struct ice_pf *pf, struct ice_flow_seg_info *seg,
 
 		entry1_h = 0;
 		vsi_h = main_vsi->tc_map_vsi[idx]->idx;
-		err = ice_flow_add_entry(hw, ICE_BLK_FD, prof_id,
+		err = ice_flow_add_entry(hw, ICE_BLK_FD, prof->id,
 					 main_vsi->idx, vsi_h,
 					 ICE_FLOW_PRIO_NORMAL, seg,
 					 &entry1_h);
@@ -748,7 +743,7 @@ ice_fdir_set_hw_fltr_rule(struct ice_pf *pf, struct ice_flow_seg_info *seg,
 
 		if (!hw_prof->entry_h[idx][tun])
 			continue;
-		ice_rem_prof_id_flow(hw, ICE_BLK_FD, vsi_num, prof_id);
+		ice_rem_prof_id_flow(hw, ICE_BLK_FD, vsi_num, prof->id);
 		ice_flow_rem_entry(hw, ICE_BLK_FD, hw_prof->entry_h[idx][tun]);
 		hw_prof->entry_h[idx][tun] = 0;
 		if (del_last)
@@ -758,10 +753,10 @@ ice_fdir_set_hw_fltr_rule(struct ice_pf *pf, struct ice_flow_seg_info *seg,
 		hw_prof->cnt = 0;
 err_entry:
 	ice_rem_prof_id_flow(hw, ICE_BLK_FD,
-			     ice_get_hw_vsi_num(hw, main_vsi->idx), prof_id);
+			     ice_get_hw_vsi_num(hw, main_vsi->idx), prof->id);
 	ice_flow_rem_entry(hw, ICE_BLK_FD, entry1_h);
 err_prof:
-	ice_flow_rem_prof(hw, ICE_BLK_FD, prof_id);
+	ice_flow_rem_prof(hw, ICE_BLK_FD, prof->id);
 	dev_err(dev, "Failed to add filter.  Flow director filters on each port must have the same input set.\n");
 
 	return err;
diff --git a/drivers/net/ethernet/intel/ice/ice_flex_pipe.c b/drivers/net/ethernet/intel/ice/ice_flex_pipe.c
index 5ce413965930..41260110c29c 100644
--- a/drivers/net/ethernet/intel/ice/ice_flex_pipe.c
+++ b/drivers/net/ethernet/intel/ice/ice_flex_pipe.c
@@ -2150,6 +2150,7 @@ void ice_clear_hw_tbls(struct ice_hw *hw)
 
 	for (i = 0; i < ICE_BLK_COUNT; i++) {
 		struct ice_prof_redir *prof_redir = &hw->blk[i].prof_redir;
+		struct ice_prof_id *prof_id = &hw->blk[i].prof_id;
 		struct ice_prof_tcam *prof = &hw->blk[i].prof;
 		struct ice_xlt1 *xlt1 = &hw->blk[i].xlt1;
 		struct ice_xlt2 *xlt2 = &hw->blk[i].xlt2;
@@ -2180,6 +2181,8 @@ void ice_clear_hw_tbls(struct ice_hw *hw)
 		memset(es->ref_count, 0, es->count * sizeof(*es->ref_count));
 		memset(es->written, 0, es->count * sizeof(*es->written));
 		memset(es->mask_ena, 0, es->count * sizeof(*es->mask_ena));
+
+		memset(prof_id->id, 0, prof_id->count * sizeof(*prof_id->id));
 	}
 }
 
@@ -2196,6 +2199,7 @@ int ice_init_hw_tbls(struct ice_hw *hw)
 	ice_init_all_prof_masks(hw);
 	for (i = 0; i < ICE_BLK_COUNT; i++) {
 		struct ice_prof_redir *prof_redir = &hw->blk[i].prof_redir;
+		struct ice_prof_id *prof_id = &hw->blk[i].prof_id;
 		struct ice_prof_tcam *prof = &hw->blk[i].prof;
 		struct ice_xlt1 *xlt1 = &hw->blk[i].xlt1;
 		struct ice_xlt2 *xlt2 = &hw->blk[i].xlt2;
@@ -2301,6 +2305,12 @@ int ice_init_hw_tbls(struct ice_hw *hw)
 					    sizeof(*es->mask_ena), GFP_KERNEL);
 		if (!es->mask_ena)
 			goto err;
+
+		prof_id->count = blk_sizes[i].prof_id;
+		prof_id->id = devm_kcalloc(ice_hw_to_dev(hw), prof_id->count,
+					   sizeof(*prof_id->id), GFP_KERNEL);
+		if (!prof_id->id)
+			goto err;
 	}
 	return 0;
 
diff --git a/drivers/net/ethernet/intel/ice/ice_flex_type.h b/drivers/net/ethernet/intel/ice/ice_flex_type.h
index 4f42e14ed3ae..395ebb18950a 100644
--- a/drivers/net/ethernet/intel/ice/ice_flex_type.h
+++ b/drivers/net/ethernet/intel/ice/ice_flex_type.h
@@ -304,10 +304,16 @@ struct ice_masks {
 	struct ice_mask masks[ICE_PROF_MASK_COUNT];
 };
 
+struct ice_prof_id {
+	unsigned long *id;
+	int count;
+};
+
 /* Tables per block */
 struct ice_blk_info {
 	struct ice_xlt1 xlt1;
 	struct ice_xlt2 xlt2;
+	struct ice_prof_id prof_id;
 	struct ice_prof_tcam prof;
 	struct ice_prof_redir prof_redir;
 	struct ice_es es;
diff --git a/drivers/net/ethernet/intel/ice/ice_flow.c b/drivers/net/ethernet/intel/ice/ice_flow.c
index ff76eaabfb69..44f90d243fe7 100644
--- a/drivers/net/ethernet/intel/ice/ice_flow.c
+++ b/drivers/net/ethernet/intel/ice/ice_flow.c
@@ -1329,7 +1329,6 @@ ice_flow_rem_entry_sync(struct ice_hw *hw, enum ice_block __always_unused blk,
  * @hw: pointer to the HW struct
  * @blk: classification stage
  * @dir: flow direction
- * @prof_id: unique ID to identify this flow profile
  * @segs: array of one or more packet segments that describe the flow
  * @segs_cnt: number of packet segments provided
  * @prof: stores the returned flow profile added
@@ -1338,17 +1337,24 @@ ice_flow_rem_entry_sync(struct ice_hw *hw, enum ice_block __always_unused blk,
  */
 static int
 ice_flow_add_prof_sync(struct ice_hw *hw, enum ice_block blk,
-		       enum ice_flow_dir dir, u64 prof_id,
+		       enum ice_flow_dir dir,
 		       struct ice_flow_seg_info *segs, u8 segs_cnt,
 		       struct ice_flow_prof **prof)
 {
 	struct ice_flow_prof_params *params;
+	struct ice_prof_id *ids;
 	int status;
+	u64 prof_id;
 	u8 i;
 
 	if (!prof)
 		return -EINVAL;
 
+	ids = &hw->blk[blk].prof_id;
+	prof_id = find_first_zero_bit(ids->id, ids->count);
+	if (prof_id >= ids->count)
+		return -ENOSPC;
+
 	params = kzalloc(sizeof(*params), GFP_KERNEL);
 	if (!params)
 		return -ENOMEM;
@@ -1394,6 +1400,7 @@ ice_flow_add_prof_sync(struct ice_hw *hw, enum ice_block blk,
 
 	INIT_LIST_HEAD(&params->prof->entries);
 	mutex_init(&params->prof->entries_lock);
+	set_bit(prof_id, ids->id);
 	*prof = params->prof;
 
 out:
@@ -1437,6 +1444,7 @@ ice_flow_rem_prof_sync(struct ice_hw *hw, enum ice_block blk,
 	/* Remove all hardware profiles associated with this flow profile */
 	status = ice_rem_prof(hw, blk, prof->id);
 	if (!status) {
+		clear_bit(prof->id, hw->blk[blk].prof_id.id);
 		list_del(&prof->l_entry);
 		mutex_destroy(&prof->entries_lock);
 		devm_kfree(ice_hw_to_dev(hw), prof);
@@ -1512,14 +1520,13 @@ ice_flow_disassoc_prof(struct ice_hw *hw, enum ice_block blk,
  * @hw: pointer to the HW struct
  * @blk: classification stage
  * @dir: flow direction
- * @prof_id: unique ID to identify this flow profile
  * @segs: array of one or more packet segments that describe the flow
  * @segs_cnt: number of packet segments provided
  * @prof: stores the returned flow profile added
  */
 int
 ice_flow_add_prof(struct ice_hw *hw, enum ice_block blk, enum ice_flow_dir dir,
-		  u64 prof_id, struct ice_flow_seg_info *segs, u8 segs_cnt,
+		  struct ice_flow_seg_info *segs, u8 segs_cnt,
 		  struct ice_flow_prof **prof)
 {
 	int status;
@@ -1539,8 +1546,7 @@ ice_flow_add_prof(struct ice_hw *hw, enum ice_block blk, enum ice_flow_dir dir,
 
 	mutex_lock(&hw->fl_profs_locks[blk]);
 
-	status = ice_flow_add_prof_sync(hw, blk, dir, prof_id, segs, segs_cnt,
-					prof);
+	status = ice_flow_add_prof_sync(hw, blk, dir, segs, segs_cnt, prof);
 	if (!status)
 		list_add(&(*prof)->l_entry, &hw->fl_profs[blk]);
 
@@ -2069,28 +2075,6 @@ ice_add_rss_list(struct ice_hw *hw, u16 vsi_handle, struct ice_flow_prof *prof)
 	return 0;
 }
 
-#define ICE_FLOW_PROF_HASH_S	0
-#define ICE_FLOW_PROF_HASH_M	GENMASK_ULL(31, 0)
-#define ICE_FLOW_PROF_HDR_S	32
-#define ICE_FLOW_PROF_HDR_M	GENMASK_ULL(61, 32)
-#define ICE_FLOW_PROF_ENCAP_S	62
-#define ICE_FLOW_PROF_ENCAP_M	GENMASK_ULL(63, 62)
-
-/* Flow profile ID format:
- * [0:31] - Packet match fields
- * [32:61] - Protocol header
- * [62:63] - Encapsulation flag:
- *	     0 if non-tunneled
- *	     1 if tunneled
- *	     2 for tunneled with outer ipv4
- *	     3 for tunneled with outer ipv6
- */
-#define ICE_FLOW_GEN_PROFID(hash, hdr, encap)                                \
-	((u64)(((u64)(hash) & ICE_FLOW_PROF_HASH_M) |                        \
-	       (((u64)(hdr) << ICE_FLOW_PROF_HDR_S) & ICE_FLOW_PROF_HDR_M) | \
-	       (((u64)(encap) << ICE_FLOW_PROF_ENCAP_S) &                    \
-		ICE_FLOW_PROF_ENCAP_M)))
-
 /**
  * ice_add_rss_cfg_sync - add an RSS configuration
  * @hw: pointer to the hardware structure
@@ -2168,13 +2152,8 @@ ice_add_rss_cfg_sync(struct ice_hw *hw, u16 vsi_handle,
 		goto exit;
 	}
 
-	/* Create a new flow profile with generated profile and packet
-	 * segment information.
-	 */
+	/* Create a new flow profile with packet segment information. */
 	status = ice_flow_add_prof(hw, blk, ICE_FLOW_RX,
-				   ICE_FLOW_GEN_PROFID(cfg->hash_flds,
-						       segs[segs_cnt - 1].hdrs,
-						       cfg->hdr_type),
 				   segs, segs_cnt, &prof);
 	if (status)
 		goto exit;
diff --git a/drivers/net/ethernet/intel/ice/ice_flow.h b/drivers/net/ethernet/intel/ice/ice_flow.h
index 7a1db1df760e..73a54e1dd31f 100644
--- a/drivers/net/ethernet/intel/ice/ice_flow.h
+++ b/drivers/net/ethernet/intel/ice/ice_flow.h
@@ -406,7 +406,7 @@ struct ice_rss_cfg {
 
 int
 ice_flow_add_prof(struct ice_hw *hw, enum ice_block blk, enum ice_flow_dir dir,
-		  u64 prof_id, struct ice_flow_seg_info *segs, u8 segs_cnt,
+		  struct ice_flow_seg_info *segs, u8 segs_cnt,
 		  struct ice_flow_prof **prof);
 int ice_flow_rem_prof(struct ice_hw *hw, enum ice_block blk, u64 prof_id);
 int
diff --git a/drivers/net/ethernet/intel/ice/ice_main.c b/drivers/net/ethernet/intel/ice/ice_main.c
index c726913bc635..20fb53ea4e5b 100644
--- a/drivers/net/ethernet/intel/ice/ice_main.c
+++ b/drivers/net/ethernet/intel/ice/ice_main.c
@@ -8117,13 +8117,12 @@ static int ice_add_vsi_to_fdir(struct ice_pf *pf, struct ice_vsi *vsi)
 
 		for (tun = 0; tun < ICE_FD_HW_SEG_MAX; tun++) {
 			enum ice_flow_priority prio;
-			u64 prof_id;
 
 			/* add this VSI to FDir profile for this flow */
 			prio = ICE_FLOW_PRIO_NORMAL;
 			prof = hw->fdir_prof[flow];
-			prof_id = flow + tun * ICE_FLTR_PTYPE_MAX;
-			status = ice_flow_add_entry(hw, ICE_BLK_FD, prof_id,
+			status = ice_flow_add_entry(hw, ICE_BLK_FD,
+						    prof->prof_id[tun],
 						    prof->vsi_h[0], vsi->idx,
 						    prio, prof->fdir_seg[tun],
 						    &entry_h);
diff --git a/drivers/net/ethernet/intel/ice/ice_type.h b/drivers/net/ethernet/intel/ice/ice_type.h
index bb5d8b681bc2..af468b2f1da6 100644
--- a/drivers/net/ethernet/intel/ice/ice_type.h
+++ b/drivers/net/ethernet/intel/ice/ice_type.h
@@ -245,6 +245,7 @@ struct ice_fd_hw_prof {
 	int cnt;
 	u64 entry_h[ICE_MAX_FDIR_VSI_PER_FILTER][ICE_FD_HW_SEG_MAX];
 	u16 vsi_h[ICE_MAX_FDIR_VSI_PER_FILTER];
+	u64 prof_id[ICE_FD_HW_SEG_MAX];
 };
 
 /* Common HW capabilities for SW use */
diff --git a/drivers/net/ethernet/intel/ice/ice_virtchnl_fdir.c b/drivers/net/ethernet/intel/ice/ice_virtchnl_fdir.c
index daa6a1e894cf..5cd143863b21 100644
--- a/drivers/net/ethernet/intel/ice/ice_virtchnl_fdir.c
+++ b/drivers/net/ethernet/intel/ice/ice_virtchnl_fdir.c
@@ -10,19 +10,6 @@
 #define to_fltr_conf_from_desc(p) \
 	container_of(p, struct virtchnl_fdir_fltr_conf, input)
 
-#define ICE_FLOW_PROF_TYPE_S	0
-#define ICE_FLOW_PROF_TYPE_M	(0xFFFFFFFFULL << ICE_FLOW_PROF_TYPE_S)
-#define ICE_FLOW_PROF_VSI_S	32
-#define ICE_FLOW_PROF_VSI_M	(0xFFFFFFFFULL << ICE_FLOW_PROF_VSI_S)
-
-/* Flow profile ID format:
- * [0:31] - flow type, flow + tun_offs
- * [32:63] - VSI index
- */
-#define ICE_FLOW_PROF_FD(vsi, flow, tun_offs) \
-	((u64)(((((flow) + (tun_offs)) & ICE_FLOW_PROF_TYPE_M)) | \
-	      (((u64)(vsi) << ICE_FLOW_PROF_VSI_S) & ICE_FLOW_PROF_VSI_M)))
-
 #define GTPU_TEID_OFFSET 4
 #define GTPU_EH_QFI_OFFSET 1
 #define GTPU_EH_QFI_MASK 0x3F
@@ -493,6 +480,7 @@ ice_vc_fdir_rem_prof(struct ice_vf *vf, enum ice_fltr_ptype flow, int tun)
 		return;
 
 	vf_prof = fdir->fdir_prof[flow];
+	prof_id = vf_prof->prof_id[tun];
 
 	vf_vsi = ice_get_vf_vsi(vf);
 	if (!vf_vsi) {
@@ -503,9 +491,6 @@ ice_vc_fdir_rem_prof(struct ice_vf *vf, enum ice_fltr_ptype flow, int tun)
 	if (!fdir->prof_entry_cnt[flow][tun])
 		return;
 
-	prof_id = ICE_FLOW_PROF_FD(vf_vsi->vsi_num,
-				   flow, tun ? ICE_FLTR_PTYPE_MAX : 0);
-
 	for (i = 0; i < fdir->prof_entry_cnt[flow][tun]; i++)
 		if (vf_prof->entry_h[i][tun]) {
 			u16 vsi_num = ice_get_hw_vsi_num(hw, vf_prof->vsi_h[i]);
@@ -647,7 +632,6 @@ ice_vc_fdir_write_flow_prof(struct ice_vf *vf, enum ice_fltr_ptype flow,
 	struct ice_hw *hw;
 	u64 entry1_h = 0;
 	u64 entry2_h = 0;
-	u64 prof_id;
 	int ret;
 
 	pf = vf->pf;
@@ -681,10 +665,7 @@ ice_vc_fdir_write_flow_prof(struct ice_vf *vf, enum ice_fltr_ptype flow,
 		ice_vc_fdir_rem_prof(vf, flow, tun);
 	}
 
-	prof_id = ICE_FLOW_PROF_FD(vf_vsi->vsi_num, flow,
-				   tun ? ICE_FLTR_PTYPE_MAX : 0);
-
-	ret = ice_flow_add_prof(hw, ICE_BLK_FD, ICE_FLOW_RX, prof_id, seg,
+	ret = ice_flow_add_prof(hw, ICE_BLK_FD, ICE_FLOW_RX, seg,
 				tun + 1, &prof);
 	if (ret) {
 		dev_dbg(dev, "Could not add VSI flow 0x%x for VF %d\n",
@@ -692,7 +673,7 @@ ice_vc_fdir_write_flow_prof(struct ice_vf *vf, enum ice_fltr_ptype flow,
 		goto err_exit;
 	}
 
-	ret = ice_flow_add_entry(hw, ICE_BLK_FD, prof_id, vf_vsi->idx,
+	ret = ice_flow_add_entry(hw, ICE_BLK_FD, prof->id, vf_vsi->idx,
 				 vf_vsi->idx, ICE_FLOW_PRIO_NORMAL,
 				 seg, &entry1_h);
 	if (ret) {
@@ -701,7 +682,7 @@ ice_vc_fdir_write_flow_prof(struct ice_vf *vf, enum ice_fltr_ptype flow,
 		goto err_prof;
 	}
 
-	ret = ice_flow_add_entry(hw, ICE_BLK_FD, prof_id, vf_vsi->idx,
+	ret = ice_flow_add_entry(hw, ICE_BLK_FD, prof->id, vf_vsi->idx,
 				 ctrl_vsi->idx, ICE_FLOW_PRIO_NORMAL,
 				 seg, &entry2_h);
 	if (ret) {
@@ -725,14 +706,16 @@ ice_vc_fdir_write_flow_prof(struct ice_vf *vf, enum ice_fltr_ptype flow,
 	vf_prof->cnt++;
 	fdir->prof_entry_cnt[flow][tun]++;
 
+	vf_prof->prof_id[tun] = prof->id;
+
 	return 0;
 
 err_entry_1:
 	ice_rem_prof_id_flow(hw, ICE_BLK_FD,
-			     ice_get_hw_vsi_num(hw, vf_vsi->idx), prof_id);
+			     ice_get_hw_vsi_num(hw, vf_vsi->idx), prof->id);
 	ice_flow_rem_entry(hw, ICE_BLK_FD, entry1_h);
 err_prof:
-	ice_flow_rem_prof(hw, ICE_BLK_FD, prof_id);
+	ice_flow_rem_prof(hw, ICE_BLK_FD, prof->id);
 err_exit:
 	return ret;
 }
-- 
2.34.1


