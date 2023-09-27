Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C98E07AFFFF
	for <lists+linux-doc@lfdr.de>; Wed, 27 Sep 2023 11:27:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229993AbjI0J1h (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Wed, 27 Sep 2023 05:27:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46388 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231128AbjI0J1a (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 27 Sep 2023 05:27:30 -0400
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4405B194;
        Wed, 27 Sep 2023 02:27:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695806848; x=1727342848;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=uQQzqPksS02qnnap/mW0aZWT5FiVA4znGia14q3h/OQ=;
  b=L5g8yxPdS9OjwdNhqSODQqZgN3TMQbbFrQ5RRNAbSHJyGFuFIkS29NPG
   j+fDqqBqYesz9y5tZnMspoQICbgPZ7oM5JiZvWlOrrpKSiPoJnVhJ3n8X
   P/eQBAQLemPIw161B+hjoNm/EYdoe+ZutfZE4X5y1B1nL4XtGEaU91MUw
   tn5PDj4vLuHvhDxrU+fWbOIBlG6QlRLwb7hV1BDg6gbfD3DcSmr5+Amok
   XI7RH8deQlLeoKHJaBYgDPJUFn1Ph0kYCEJFfrjTf1Of9b1clWtGbaMgz
   P8hI99ET6TQidZJKCKNr0WuE9FQWt9Aq+pDsMxwYxKQYMb1MsLAcbieK+
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10845"; a="412692394"
X-IronPort-AV: E=Sophos;i="6.03,179,1694761200"; 
   d="scan'208";a="412692394"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Sep 2023 02:27:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10845"; a="778479331"
X-IronPort-AV: E=Sophos;i="6.03,179,1694761200"; 
   d="scan'208";a="778479331"
Received: from amlin-018-114.igk.intel.com ([10.102.18.114])
  by orsmga008.jf.intel.com with ESMTP; 27 Sep 2023 02:27:23 -0700
From:   Arkadiusz Kubalewski <arkadiusz.kubalewski@intel.com>
To:     netdev@vger.kernel.org
Cc:     vadim.fedorenko@linux.dev, jiri@resnulli.us, corbet@lwn.net,
        davem@davemloft.net, kuba@kernel.org, pabeni@redhat.com,
        jesse.brandeburg@intel.com, anthony.l.nguyen@intel.com,
        linux-doc@vger.kernel.org, intel-wired-lan@lists.osuosl.org,
        Arkadiusz Kubalewski <arkadiusz.kubalewski@intel.com>
Subject: [PATCH net-next 4/4] ice: dpll: implement phase related callbacks
Date:   Wed, 27 Sep 2023 11:24:35 +0200
Message-Id: <20230927092435.1565336-5-arkadiusz.kubalewski@intel.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230927092435.1565336-1-arkadiusz.kubalewski@intel.com>
References: <20230927092435.1565336-1-arkadiusz.kubalewski@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Implement callback op related to phase-offset measurement for input pins
to provide user with measured value.
Implement callback ops related to phase-adjust get and set to allow
the user with control over adjustable value of phase on pin's signal.
Fill pin-adjust(-min/-max) limit values on pin-properties structure.

Signed-off-by: Arkadiusz Kubalewski <arkadiusz.kubalewski@intel.com>
---
 drivers/net/ethernet/intel/ice/ice_dpll.c | 224 +++++++++++++++++++++-
 drivers/net/ethernet/intel/ice/ice_dpll.h |  10 +-
 2 files changed, 230 insertions(+), 4 deletions(-)

diff --git a/drivers/net/ethernet/intel/ice/ice_dpll.c b/drivers/net/ethernet/intel/ice/ice_dpll.c
index 1faee9cb944d..6f7a2916f6c2 100644
--- a/drivers/net/ethernet/intel/ice/ice_dpll.c
+++ b/drivers/net/ethernet/intel/ice/ice_dpll.c
@@ -878,6 +878,203 @@ ice_dpll_output_direction(const struct dpll_pin *pin, void *pin_priv,
 	return 0;
 }
 
+/**
+ * ice_dpll_pin_phase_adjust_get - callback for get pin phase adjust value
+ * @pin: pointer to a pin
+ * @pin_priv: private data pointer passed on pin registration
+ * @dpll: registered dpll pointer
+ * @dpll_priv: private data pointer passed on dpll registration
+ * @phase_adjust: on success holds pin phase_adjust value
+ * @extack: error reporting
+ *
+ * Dpll subsystem callback. Handler for getting phase adjust value of a pin.
+ *
+ * Context: Acquires pf->dplls.lock
+ * Return:
+ * * 0 - success
+ * * negative - error
+ */
+static int
+ice_dpll_pin_phase_adjust_get(const struct dpll_pin *pin, void *pin_priv,
+			      const struct dpll_device *dpll, void *dpll_priv,
+			      s32 *phase_adjust,
+			      struct netlink_ext_ack *extack)
+{
+	struct ice_dpll_pin *p = pin_priv;
+	struct ice_pf *pf = p->pf;
+
+	mutex_lock(&pf->dplls.lock);
+	*phase_adjust = p->phase_adjust;
+	mutex_unlock(&pf->dplls.lock);
+
+	return 0;
+}
+
+/**
+ * ice_dpll_pin_phase_adjust_set - helper for setting a pin phase adjust value
+ * @pin: pointer to a pin
+ * @pin_priv: private data pointer passed on pin registration
+ * @dpll: registered dpll pointer
+ * @dpll_priv: private data pointer passed on dpll registration
+ * @phase_adjust: phase_adjust to be set
+ * @extack: error reporting
+ * @type: type of a pin
+ *
+ * Helper for dpll subsystem callback. Handler for setting phase adjust value
+ * of a pin.
+ *
+ * Context: Acquires pf->dplls.lock
+ * Return:
+ * * 0 - success
+ * * negative - error
+ */
+static int
+ice_dpll_pin_phase_adjust_set(const struct dpll_pin *pin, void *pin_priv,
+			      const struct dpll_device *dpll, void *dpll_priv,
+			      s32 phase_adjust,
+			      struct netlink_ext_ack *extack,
+			      enum ice_dpll_pin_type type)
+{
+	struct ice_dpll_pin *p = pin_priv;
+	struct ice_dpll *d = dpll_priv;
+	struct ice_pf *pf = d->pf;
+	u8 flag, flags_en = 0;
+	int ret;
+
+	mutex_lock(&pf->dplls.lock);
+	if (phase_adjust == p->phase_adjust) {
+		mutex_unlock(&pf->dplls.lock);
+		return 0;
+	}
+	switch (type) {
+	case ICE_DPLL_PIN_TYPE_INPUT:
+		flag = ICE_AQC_SET_CGU_IN_CFG_FLG1_UPDATE_DELAY;
+		if (p->flags[0] & ICE_AQC_GET_CGU_IN_CFG_FLG2_ESYNC_EN)
+			flags_en |= ICE_AQC_SET_CGU_IN_CFG_FLG2_ESYNC_EN;
+		if (p->flags[0] & ICE_AQC_GET_CGU_IN_CFG_FLG2_INPUT_EN)
+			flags_en |= ICE_AQC_SET_CGU_IN_CFG_FLG2_INPUT_EN;
+		ret = ice_aq_set_input_pin_cfg(&pf->hw, p->idx, flag, flags_en,
+					       0, phase_adjust);
+		break;
+	case ICE_DPLL_PIN_TYPE_OUTPUT:
+		flag = ICE_AQC_SET_CGU_OUT_CFG_UPDATE_PHASE;
+		if (p->flags[0] & ICE_AQC_GET_CGU_OUT_CFG_OUT_EN)
+			flag |= ICE_AQC_SET_CGU_OUT_CFG_OUT_EN;
+		if (p->flags[0] & ICE_AQC_GET_CGU_OUT_CFG_ESYNC_EN)
+			flag |= ICE_AQC_SET_CGU_OUT_CFG_ESYNC_EN;
+		ret = ice_aq_set_output_pin_cfg(&pf->hw, p->idx, flag, 0, 0,
+						phase_adjust);
+		break;
+	default:
+		ret = -EINVAL;
+	}
+	if (!ret)
+		p->phase_adjust = phase_adjust;
+	mutex_unlock(&pf->dplls.lock);
+	if (ret)
+		NL_SET_ERR_MSG_FMT(extack,
+				   "err:%d %s failed to set pin phase_adjust:%d for pin:%u on dpll:%u\n",
+				   ret,
+				   ice_aq_str(pf->hw.adminq.sq_last_status),
+				   phase_adjust, p->idx, d->dpll_idx);
+
+	return ret;
+}
+
+/**
+ * ice_dpll_input_phase_adjust_set - callback for set input pin phase adjust
+ * @pin: pointer to a pin
+ * @pin_priv: private data pointer passed on pin registration
+ * @dpll: registered dpll pointer
+ * @dpll_priv: private data pointer passed on dpll registration
+ * @phase_adjust: phase_adjust to be set
+ * @extack: error reporting
+ *
+ * Dpll subsystem callback. Wraps a handler for setting phase adjust on input
+ * pin.
+ *
+ * Context: Calls a function which acquires pf->dplls.lock
+ * Return:
+ * * 0 - success
+ * * negative - error
+ */
+static int
+ice_dpll_input_phase_adjust_set(const struct dpll_pin *pin, void *pin_priv,
+				const struct dpll_device *dpll, void *dpll_priv,
+				s32 phase_adjust,
+				struct netlink_ext_ack *extack)
+{
+	return ice_dpll_pin_phase_adjust_set(pin, pin_priv, dpll, dpll_priv,
+					     phase_adjust, extack,
+					     ICE_DPLL_PIN_TYPE_INPUT);
+}
+
+/**
+ * ice_dpll_output_phase_adjust_set - callback for set output pin phase adjust
+ * @pin: pointer to a pin
+ * @pin_priv: private data pointer passed on pin registration
+ * @dpll: registered dpll pointer
+ * @dpll_priv: private data pointer passed on dpll registration
+ * @phase_adjust: phase_adjust to be set
+ * @extack: error reporting
+ *
+ * Dpll subsystem callback. Wraps a handler for setting phase adjust on output
+ * pin.
+ *
+ * Context: Calls a function which acquires pf->dplls.lock
+ * Return:
+ * * 0 - success
+ * * negative - error
+ */
+static int
+ice_dpll_output_phase_adjust_set(const struct dpll_pin *pin, void *pin_priv,
+				 const struct dpll_device *dpll, void *dpll_priv,
+				 s32 phase_adjust,
+				 struct netlink_ext_ack *extack)
+{
+	return ice_dpll_pin_phase_adjust_set(pin, pin_priv, dpll, dpll_priv,
+					     phase_adjust, extack,
+					     ICE_DPLL_PIN_TYPE_OUTPUT);
+}
+
+#define ICE_DPLL_PHASE_OFFSET_DIVIDER	100
+#define ICE_DPLL_PHASE_OFFSET_FACTOR		\
+	(DPLL_PHASE_OFFSET_DIVIDER / ICE_DPLL_PHASE_OFFSET_DIVIDER)
+/**
+ * ice_dpll_phase_offset_get - callback for get dpll phase shift value
+ * @pin: pointer to a pin
+ * @pin_priv: private data pointer passed on pin registration
+ * @dpll: registered dpll pointer
+ * @dpll_priv: private data pointer passed on dpll registration
+ * @phase_adjust: on success holds pin phase_adjust value
+ * @extack: error reporting
+ *
+ * Dpll subsystem callback. Handler for getting phase shift value between
+ * dpll's input and output.
+ *
+ * Context: Acquires pf->dplls.lock
+ * Return:
+ * * 0 - success
+ * * negative - error
+ */
+static int
+ice_dpll_phase_offset_get(const struct dpll_pin *pin, void *pin_priv,
+			  const struct dpll_device *dpll, void *dpll_priv,
+			  s64 *phase_offset, struct netlink_ext_ack *extack)
+{
+	struct ice_dpll *d = dpll_priv;
+	struct ice_pf *pf = d->pf;
+
+	mutex_lock(&pf->dplls.lock);
+	if (d->active_input == pin)
+		*phase_offset = d->phase_offset * ICE_DPLL_PHASE_OFFSET_FACTOR;
+	else
+		*phase_offset = 0;
+	mutex_unlock(&pf->dplls.lock);
+
+	return 0;
+}
+
 /**
  * ice_dpll_rclk_state_on_pin_set - set a state on rclk pin
  * @pin: pointer to a pin
@@ -993,6 +1190,9 @@ static const struct dpll_pin_ops ice_dpll_input_ops = {
 	.prio_get = ice_dpll_input_prio_get,
 	.prio_set = ice_dpll_input_prio_set,
 	.direction_get = ice_dpll_input_direction,
+	.phase_adjust_get = ice_dpll_pin_phase_adjust_get,
+	.phase_adjust_set = ice_dpll_input_phase_adjust_set,
+	.phase_offset_get = ice_dpll_phase_offset_get,
 };
 
 static const struct dpll_pin_ops ice_dpll_output_ops = {
@@ -1001,6 +1201,8 @@ static const struct dpll_pin_ops ice_dpll_output_ops = {
 	.state_on_dpll_get = ice_dpll_output_state_get,
 	.state_on_dpll_set = ice_dpll_output_state_set,
 	.direction_get = ice_dpll_output_direction,
+	.phase_adjust_get = ice_dpll_pin_phase_adjust_get,
+	.phase_adjust_set = ice_dpll_output_phase_adjust_set,
 };
 
 static const struct dpll_device_ops ice_dpll_ops = {
@@ -1031,6 +1233,8 @@ static u64 ice_generate_clock_id(struct ice_pf *pf)
  */
 static void ice_dpll_notify_changes(struct ice_dpll *d)
 {
+	bool pin_notified = false;
+
 	if (d->prev_dpll_state != d->dpll_state) {
 		d->prev_dpll_state = d->dpll_state;
 		dpll_device_change_ntf(d->dpll);
@@ -1039,7 +1243,14 @@ static void ice_dpll_notify_changes(struct ice_dpll *d)
 		if (d->prev_input)
 			dpll_pin_change_ntf(d->prev_input);
 		d->prev_input = d->active_input;
-		if (d->active_input)
+		if (d->active_input) {
+			dpll_pin_change_ntf(d->active_input);
+			pin_notified = true;
+		}
+	}
+	if (d->prev_phase_offset != d->phase_offset) {
+		d->prev_phase_offset = d->phase_offset;
+		if (!pin_notified && d->active_input)
 			dpll_pin_change_ntf(d->active_input);
 	}
 }
@@ -1065,7 +1276,7 @@ ice_dpll_update_state(struct ice_pf *pf, struct ice_dpll *d, bool init)
 
 	ret = ice_get_cgu_state(&pf->hw, d->dpll_idx, d->prev_dpll_state,
 				&d->input_idx, &d->ref_state, &d->eec_mode,
-				&d->phase_shift, &d->dpll_state);
+				&d->phase_offset, &d->dpll_state);
 
 	dev_dbg(ice_pf_to_dev(pf),
 		"update dpll=%d, prev_src_idx:%u, src_idx:%u, state:%d, prev:%d mode:%d\n",
@@ -1656,6 +1867,15 @@ ice_dpll_init_info_direct_pins(struct ice_pf *pf,
 				return ret;
 			pins[i].prop.capabilities |=
 				DPLL_PIN_CAPABILITIES_PRIORITY_CAN_CHANGE;
+			pins[i].prop.phase_range.min =
+				pf->dplls.input_phase_adj_max;
+			pins[i].prop.phase_range.max =
+				-pf->dplls.input_phase_adj_max;
+		} else {
+			pins[i].prop.phase_range.min =
+				pf->dplls.output_phase_adj_max,
+			pins[i].prop.phase_range.max =
+				-pf->dplls.output_phase_adj_max;
 		}
 		pins[i].prop.capabilities |=
 			DPLL_PIN_CAPABILITIES_STATE_CAN_CHANGE;
diff --git a/drivers/net/ethernet/intel/ice/ice_dpll.h b/drivers/net/ethernet/intel/ice/ice_dpll.h
index 9c524c4bdfd7..5f23f82d31a9 100644
--- a/drivers/net/ethernet/intel/ice/ice_dpll.h
+++ b/drivers/net/ethernet/intel/ice/ice_dpll.h
@@ -19,6 +19,7 @@
  * @state: state of a pin
  * @prop: pin properties
  * @freq: current frequency of a pin
+ * @phase_adjust: current phase adjust value
  */
 struct ice_dpll_pin {
 	struct dpll_pin *pin;
@@ -30,6 +31,7 @@ struct ice_dpll_pin {
 	u8 state[ICE_DPLL_RCLK_NUM_MAX];
 	struct dpll_pin_properties prop;
 	u32 freq;
+	s32 phase_adjust;
 };
 
 /** ice_dpll - store info required for DPLL control
@@ -40,7 +42,8 @@ struct ice_dpll_pin {
  * @prev_input_idx: previously selected input index
  * @ref_state: state of dpll reference signals
  * @eec_mode: eec_mode dpll is configured for
- * @phase_shift: phase shift delay of a dpll
+ * @phase_offset: phase offset of active pin vs dpll signal
+ * @prev_phase_offset: previous phase offset of active pin vs dpll signal
  * @input_prio: priorities of each input
  * @dpll_state: current dpll sync state
  * @prev_dpll_state: last dpll sync state
@@ -55,7 +58,8 @@ struct ice_dpll {
 	u8 prev_input_idx;
 	u8 ref_state;
 	u8 eec_mode;
-	s64 phase_shift;
+	s64 phase_offset;
+	s64 prev_phase_offset;
 	u8 *input_prio;
 	enum dpll_lock_status dpll_state;
 	enum dpll_lock_status prev_dpll_state;
@@ -78,6 +82,8 @@ struct ice_dpll {
  * @cgu_state_acq_err_num: number of errors returned during periodic work
  * @base_rclk_idx: idx of first pin used for clock revocery pins
  * @clock_id: clock_id of dplls
+ * @input_phase_adj_max: max phase adjust value for an input pins
+ * @output_phase_adj_max: max phase adjust value for an output pins
  */
 struct ice_dplls {
 	struct kthread_worker *kworker;
-- 
2.38.1

