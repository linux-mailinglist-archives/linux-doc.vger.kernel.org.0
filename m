Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4A7173D37F3
	for <lists+linux-doc@lfdr.de>; Fri, 23 Jul 2021 11:45:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231515AbhGWJEH (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Fri, 23 Jul 2021 05:04:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54392 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231542AbhGWJEF (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 23 Jul 2021 05:04:05 -0400
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 66EA3C0613D5
        for <linux-doc@vger.kernel.org>; Fri, 23 Jul 2021 02:44:38 -0700 (PDT)
Received: by mail-lf1-x129.google.com with SMTP id a26so1049956lfr.11
        for <linux-doc@vger.kernel.org>; Fri, 23 Jul 2021 02:44:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=8jLggNSpTuehjLQg86NpwxQzrWSywZsK3BANcyj0HLA=;
        b=hcNeJ81FN1eGT1WdQAYJ9ywL/CJhI3RVKcD9GgKXS73XwG62NF5lHV9quB/5Oi16pm
         SGmoVecEZGcckpIH71mXa0nC6JXdzo3nhOl9XPNI71G4+861TF8jhrZFEuJWuxRrpL7z
         AxLp4fbnO6M7Ot9S3SQCULgfmwiKfXiBA6ptE7Y4DFLqmyqS2WexNQEQepJPZ0w1qFWX
         EqtGfbwfzmAU61gvA69m1TsB5L9nD6L30PeA3TBdoxAWJPTgdU6QcGiAtiA+7MqAX9wd
         yi0Qm0DkTG7utX8Q1UQ6916ozGhVCiRuS+8uG4wOkhyCpC6Cw3TqD3pwpC363Qrk64q+
         R9XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=8jLggNSpTuehjLQg86NpwxQzrWSywZsK3BANcyj0HLA=;
        b=EzS+0I5cw/A0WiiiEPoha/ANYuAEFAsFUQ9XFYWLkSqbNsNBoUEG7kJuy3nMam53lV
         N9kpWcGusTbISACPzKoXW8DQ0GWt73x8e1xFhMWQxZvL/heSkxfFV44wR8DS21ZUp2Xm
         vXvo7Q2O5ziWsIdbm3i69ynubyTydoC24WJwe3RXJUfT82bb73KuWM7MVs5lMacZu0Zr
         VwLFpFlp8fmkVFy2Ui0OkBmViVHuSaORgkI7cuj6uUq1cWoVmRSMSPs3WxDu3jmdjGDH
         xIo4EUc9eGK0SISzEQXsOipg8cB63l+ma3Lv1ytCfV5YpcaYyRjg/UHY75YOlv7OEjw7
         Ko3g==
X-Gm-Message-State: AOAM531lI35JFNhBthIRA0XO8TwEy1MQ3zam2lqAgId0RPWOSkTavnx0
        tvZVLW1PjcpiHWKO9h9iV+1P0w==
X-Google-Smtp-Source: ABdhPJz6Dy/dyCIcQqGYqSBHd3QK9x+9Zg0oobKPCjAjk1PAXUiOm9lS2cv0C9BViQn9ZY6vRp3vwA==
X-Received: by 2002:ac2:5d22:: with SMTP id i2mr2468907lfb.371.1627033476560;
        Fri, 23 Jul 2021 02:44:36 -0700 (PDT)
Received: from jade.urgonet (h-94-254-48-165.A175.priv.bahnhof.se. [94.254.48.165])
        by smtp.gmail.com with ESMTPSA id f2sm403808ljq.131.2021.07.23.02.44.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Jul 2021 02:44:36 -0700 (PDT)
From:   Jens Wiklander <jens.wiklander@linaro.org>
To:     linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        op-tee@lists.trustedfirmware.org, devicetree@vger.kernel.org,
        linux-doc@vger.kernel.org
Cc:     Jerome Forissier <jerome@forissier.org>,
        Etienne Carriere <etienne.carriere@linaro.org>,
        Sumit Garg <sumit.garg@linaro.org>,
        Vincent Guittot <vincent.guittot@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Ard Biesheuvel <ardb@kernel.org>,
        Marc Zyngier <maz@kernel.org>,
        Jens Wiklander <jens.wiklander@linaro.org>
Subject: [PATCH v3 6/6] optee: add asynchronous notifications
Date:   Fri, 23 Jul 2021 11:44:22 +0200
Message-Id: <20210723094422.2150313-7-jens.wiklander@linaro.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210723094422.2150313-1-jens.wiklander@linaro.org>
References: <20210723094422.2150313-1-jens.wiklander@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Adds support for asynchronous notifications from secure world to normal
world. This allows a design with a top half and bottom half type of
driver where the top half runs in secure interrupt context and a
notifications tells normal world to schedule a yielding call to do the
bottom half processing.

The protocol is defined in optee_msg.h optee_rpc_cmd.h and optee_smc.h.

A notification consists of a 32-bit value which normal world can
retrieve using a fastcall into secure world. The value
OPTEE_SMC_ASYNC_NOTIF_VALUE_DO_BOTTOM_HALF (0) has a special meaning.
When this value is sent it means that normal world is supposed to make a
yielding call OPTEE_MSG_CMD_DO_BOTTOM_HALF.

Notification capability is negotiated while the driver is initialized.
If both sides supports these notifications then they are enabled.

An interrupt is used to notify the driver that there are asynchronous
notifications pending.  The maximum needed notification value is
communicated at this stage. This allows scaling up when needed.

Acked-by: Ard Biesheuvel <ardb@kernel.org>
Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>
---
 drivers/tee/optee/call.c          |  27 ++++++++
 drivers/tee/optee/core.c          |  82 +++++++++++++++-------
 drivers/tee/optee/notif.c         | 109 ++++++++++++++++++++++++++++--
 drivers/tee/optee/optee_msg.h     |   9 +++
 drivers/tee/optee/optee_private.h |   6 +-
 drivers/tee/optee/optee_smc.h     |  75 +++++++++++++++++++-
 6 files changed, 276 insertions(+), 32 deletions(-)

diff --git a/drivers/tee/optee/call.c b/drivers/tee/optee/call.c
index 6e6eb836e9b6..3afd43b598f9 100644
--- a/drivers/tee/optee/call.c
+++ b/drivers/tee/optee/call.c
@@ -392,6 +392,33 @@ int optee_cancel_req(struct tee_context *ctx, u32 cancel_id, u32 session)
 	return 0;
 }
 
+static int simple_call_with_arg(struct tee_context *ctx, u32 cmd)
+{
+	struct optee_msg_arg *msg_arg;
+	phys_addr_t msg_parg;
+	struct tee_shm *shm;
+
+	shm = get_msg_arg(ctx, 0, &msg_arg, &msg_parg);
+	if (IS_ERR(shm))
+		return PTR_ERR(shm);
+
+	msg_arg->cmd = cmd;
+	optee_do_call_with_arg(ctx, msg_parg);
+
+	tee_shm_free(shm);
+	return 0;
+}
+
+int optee_do_bottom_half(struct tee_context *ctx)
+{
+	return simple_call_with_arg(ctx, OPTEE_MSG_CMD_DO_BOTTOM_HALF);
+}
+
+int optee_stop_async_notif(struct tee_context *ctx)
+{
+	return simple_call_with_arg(ctx, OPTEE_MSG_CMD_STOP_ASYNC_NOTIF);
+}
+
 /**
  * optee_enable_shm_cache() - Enables caching of some shared memory allocation
  *			      in OP-TEE
diff --git a/drivers/tee/optee/core.c b/drivers/tee/optee/core.c
index 2272696ac986..e3c80505cc88 100644
--- a/drivers/tee/optee/core.c
+++ b/drivers/tee/optee/core.c
@@ -7,9 +7,12 @@
 
 #include <linux/arm-smccc.h>
 #include <linux/errno.h>
+#include <linux/interrupt.h>
 #include <linux/io.h>
+#include <linux/irqdomain.h>
 #include <linux/module.h>
 #include <linux/of.h>
+#include <linux/of_irq.h>
 #include <linux/of_platform.h>
 #include <linux/platform_device.h>
 #include <linux/slab.h>
@@ -353,6 +356,17 @@ static const struct tee_desc optee_supp_desc = {
 	.flags = TEE_DESC_PRIVILEGED,
 };
 
+static int enable_async_notif(optee_invoke_fn *invoke_fn)
+{
+	struct arm_smccc_res res;
+
+	invoke_fn(OPTEE_SMC_ENABLE_ASYNC_NOTIF, 0, 0, 0, 0, 0, 0, 0, &res);
+
+	if (res.a0)
+		return -EINVAL;
+	return 0;
+}
+
 static bool optee_msg_api_uid_is_optee_api(optee_invoke_fn *invoke_fn)
 {
 	struct arm_smccc_res res;
@@ -402,7 +416,7 @@ static bool optee_msg_api_revision_is_compatible(optee_invoke_fn *invoke_fn)
 }
 
 static bool optee_msg_exchange_capabilities(optee_invoke_fn *invoke_fn,
-					    u32 *sec_caps)
+					    u32 *sec_caps, u32 *max_notif_value)
 {
 	union {
 		struct arm_smccc_res smccc;
@@ -425,6 +439,7 @@ static bool optee_msg_exchange_capabilities(optee_invoke_fn *invoke_fn,
 		return false;
 
 	*sec_caps = res.result.capabilities;
+	*max_notif_value = res.result.max_notif_value;
 	return true;
 }
 
@@ -609,6 +624,7 @@ static int optee_probe(struct platform_device *pdev)
 	struct optee *optee = NULL;
 	void *memremaped_shm = NULL;
 	struct tee_device *teedev;
+	u32 max_notif_value;
 	u32 sec_caps;
 	int rc;
 
@@ -628,7 +644,8 @@ static int optee_probe(struct platform_device *pdev)
 		return -EINVAL;
 	}
 
-	if (!optee_msg_exchange_capabilities(invoke_fn, &sec_caps)) {
+	if (!optee_msg_exchange_capabilities(invoke_fn, &sec_caps,
+					     &max_notif_value)) {
 		pr_warn("capabilities mismatch\n");
 		return -EINVAL;
 	}
@@ -651,7 +668,7 @@ static int optee_probe(struct platform_device *pdev)
 	optee = kzalloc(sizeof(*optee), GFP_KERNEL);
 	if (!optee) {
 		rc = -ENOMEM;
-		goto err;
+		goto err_free_pool;
 	}
 
 	optee->invoke_fn = invoke_fn;
@@ -660,24 +677,24 @@ static int optee_probe(struct platform_device *pdev)
 	teedev = tee_device_alloc(&optee_desc, NULL, pool, optee);
 	if (IS_ERR(teedev)) {
 		rc = PTR_ERR(teedev);
-		goto err;
+		goto err_free_optee;
 	}
 	optee->teedev = teedev;
 
 	teedev = tee_device_alloc(&optee_supp_desc, NULL, pool, optee);
 	if (IS_ERR(teedev)) {
 		rc = PTR_ERR(teedev);
-		goto err;
+		goto err_unreg_teedev;
 	}
 	optee->supp_teedev = teedev;
 
 	rc = tee_device_register(optee->teedev);
 	if (rc)
-		goto err;
+		goto err_unreg_supp_teedev;
 
 	rc = tee_device_register(optee->supp_teedev);
 	if (rc)
-		goto err;
+		goto err_unreg_supp_teedev;
 
 	mutex_init(&optee->call_queue.mutex);
 	INIT_LIST_HEAD(&optee->call_queue.waiters);
@@ -687,10 +704,30 @@ static int optee_probe(struct platform_device *pdev)
 
 	platform_set_drvdata(pdev, optee);
 
-	rc = optee_notif_init(optee, 255);
-	if (rc) {
-		optee_remove(pdev);
-		return rc;
+	if (sec_caps & OPTEE_SMC_SEC_CAP_ASYNC_NOTIF) {
+		unsigned int irq;
+
+		rc = platform_get_irq(pdev, 0);
+		if (rc < 0) {
+			pr_err("platform_get_irq: ret %d\n", rc);
+			goto err_unreg_supp_teedev;
+		}
+		irq = rc;
+
+		rc = optee_notif_init(optee, max_notif_value, irq);
+		if (rc) {
+			irq_dispose_mapping(irq);
+			optee_remove(pdev);
+			return rc;
+		}
+		enable_async_notif(optee->invoke_fn);
+		pr_info("Asynchronous notifications enabled\n");
+	} else {
+		rc = optee_notif_init(optee, 255, 0);
+		if (rc) {
+			optee_remove(pdev);
+			return rc;
+		}
 	}
 
 	optee_enable_shm_cache(optee);
@@ -706,20 +743,15 @@ static int optee_probe(struct platform_device *pdev)
 
 	pr_info("initialized driver\n");
 	return 0;
-err:
-	if (optee) {
-		/*
-		 * tee_device_unregister() is safe to call even if the
-		 * devices hasn't been registered with
-		 * tee_device_register() yet.
-		 */
-		tee_device_unregister(optee->supp_teedev);
-		tee_device_unregister(optee->teedev);
-		kfree(optee);
-	}
-	if (pool)
-		tee_shm_pool_free(pool);
-	if (memremaped_shm)
+err_unreg_supp_teedev:
+	tee_device_unregister(optee->supp_teedev);
+err_unreg_teedev:
+	tee_device_unregister(optee->teedev);
+err_free_optee:
+	kfree(optee);
+err_free_pool:
+	tee_shm_pool_free(pool);
+	if (optee->memremaped_shm)
 		memunmap(memremaped_shm);
 	return rc;
 }
diff --git a/drivers/tee/optee/notif.c b/drivers/tee/optee/notif.c
index a28fa03dcd0e..ecfa82797695 100644
--- a/drivers/tee/optee/notif.c
+++ b/drivers/tee/optee/notif.c
@@ -7,10 +7,14 @@
 
 #include <linux/arm-smccc.h>
 #include <linux/errno.h>
+#include <linux/interrupt.h>
+#include <linux/irqdomain.h>
 #include <linux/slab.h>
 #include <linux/spinlock.h>
 #include <linux/tee_drv.h>
 #include "optee_private.h"
+#include "optee_smc.h"
+#include "optee_rpc_cmd.h"
 
 struct notif_entry {
 	struct list_head link;
@@ -18,6 +22,54 @@ struct notif_entry {
 	u_int key;
 };
 
+static u32 get_async_notif_value(optee_invoke_fn *invoke_fn, bool *value_valid,
+				 bool *value_pending)
+{
+	struct arm_smccc_res res;
+
+	invoke_fn(OPTEE_SMC_GET_ASYNC_NOTIF_VALUE, 0, 0, 0, 0, 0, 0, 0, &res);
+
+	if (res.a0)
+		return 0;
+	*value_valid = (res.a2 & OPTEE_SMC_ASYNC_NOTIF_VALUE_VALID);
+	*value_pending = (res.a2 & OPTEE_SMC_ASYNC_NOTIF_VALUE_PENDING);
+	return res.a1;
+}
+
+static irqreturn_t notif_irq_handler(int irq, void *dev_id)
+{
+	struct optee *optee = dev_id;
+	bool do_bottom_half = false;
+	bool value_valid;
+	bool value_pending;
+	u32 value;
+
+	do {
+		value = get_async_notif_value(optee->invoke_fn, &value_valid,
+					      &value_pending);
+		if (!value_valid)
+			break;
+
+		if (value == OPTEE_SMC_ASYNC_NOTIF_VALUE_DO_BOTTOM_HALF)
+			do_bottom_half = true;
+		else
+			optee_notif_send(optee, value);
+	} while (value_pending);
+
+	if (do_bottom_half)
+		return IRQ_WAKE_THREAD;
+	return IRQ_HANDLED;
+}
+
+static irqreturn_t notif_irq_thread_fn(int irq, void *dev_id)
+{
+	struct optee *optee = dev_id;
+
+	optee_do_bottom_half(optee->notif.ctx);
+
+	return IRQ_HANDLED;
+}
+
 static bool have_key(struct optee *optee, u_int key)
 {
 	struct notif_entry *entry;
@@ -106,20 +158,69 @@ int optee_notif_send(struct optee *optee, u_int key)
 	return 0;
 }
 
-int optee_notif_init(struct optee *optee, u_int max_key)
+int optee_notif_init(struct optee *optee, u_int max_key, u_int irq)
 {
+	struct tee_context *ctx;
+	int rc;
+
+	if (irq) {
+		ctx = tee_dev_open_helper(optee->teedev);
+		if (IS_ERR(ctx))
+			return PTR_ERR(ctx);
+
+		optee->notif.ctx = ctx;
+	}
+
 	spin_lock_init(&optee->notif.lock);
 	INIT_LIST_HEAD(&optee->notif.db);
 	optee->notif.bitmap = bitmap_zalloc(max_key, GFP_KERNEL);
-	if (!optee->notif.bitmap)
-		return -ENOMEM;
-
+	if (!optee->notif.bitmap) {
+		rc = -ENOMEM;
+		goto err_put_ctx;
+	}
 	optee->notif.max_key = max_key;
 
+	if (irq) {
+		rc = request_threaded_irq(irq, notif_irq_handler,
+					  notif_irq_thread_fn,
+					  0, "optee_notification", optee);
+		if (rc)
+			goto err_free_bitmap;
+
+		optee->notif.irq = irq;
+	}
+
 	return 0;
+
+err_free_bitmap:
+	kfree(optee->notif.bitmap);
+err_put_ctx:
+	tee_dev_ctx_put(optee->notif.ctx);
+	optee->notif.ctx = NULL;
+
+	return rc;
 }
 
 void optee_notif_uninit(struct optee *optee)
 {
+	if (optee->notif.ctx) {
+		optee_stop_async_notif(optee->notif.ctx);
+		if (optee->notif.irq) {
+			free_irq(optee->notif.irq, optee);
+			irq_dispose_mapping(optee->notif.irq);
+		}
+
+		/*
+		 * The thread normally working with optee->notif.ctx was
+		 * stopped with free_irq() above.
+		 *
+		 * Note we're not using teedev_close_context() or
+		 * tee_client_close_context() since we have already called
+		 * tee_device_put() while initializing to avoid a circular
+		 * reference counting.
+		 */
+		tee_dev_ctx_put(optee->notif.ctx);
+	}
+
 	kfree(optee->notif.bitmap);
 }
diff --git a/drivers/tee/optee/optee_msg.h b/drivers/tee/optee/optee_msg.h
index e3d72d09c484..3e09c8386e46 100644
--- a/drivers/tee/optee/optee_msg.h
+++ b/drivers/tee/optee/optee_msg.h
@@ -293,6 +293,13 @@ struct optee_msg_arg {
  * [in] param[0].u.rmem.shm_ref		holds shared memory reference
  * [in] param[0].u.rmem.offs		0
  * [in] param[0].u.rmem.size		0
+ *
+ * OPTEE_MSG_CMD_DO_BOTTOM_HALF does the scheduled bottom half processing
+ * of a driver.
+ *
+ * OPTEE_MSG_CMD_STOP_ASYNC_NOTIF informs secure world that from now is
+ * normal world unable to process asynchronous notifications. Typically
+ * used when the driver is shut down.
  */
 #define OPTEE_MSG_CMD_OPEN_SESSION	0
 #define OPTEE_MSG_CMD_INVOKE_COMMAND	1
@@ -300,6 +307,8 @@ struct optee_msg_arg {
 #define OPTEE_MSG_CMD_CANCEL		3
 #define OPTEE_MSG_CMD_REGISTER_SHM	4
 #define OPTEE_MSG_CMD_UNREGISTER_SHM	5
+#define OPTEE_MSG_CMD_DO_BOTTOM_HALF	6
+#define OPTEE_MSG_CMD_STOP_ASYNC_NOTIF	7
 #define OPTEE_MSG_FUNCID_CALL_WITH_ARG	0x0004
 
 #endif /* _OPTEE_MSG_H */
diff --git a/drivers/tee/optee/optee_private.h b/drivers/tee/optee/optee_private.h
index 7dc058d008b2..62365912a70b 100644
--- a/drivers/tee/optee/optee_private.h
+++ b/drivers/tee/optee/optee_private.h
@@ -37,6 +37,8 @@ struct optee_call_queue {
 
 struct optee_notif {
 	u_int max_key;
+	unsigned int irq;
+	struct tee_context *ctx;
 	/* Serializes access to the elements below in this struct */
 	spinlock_t lock;
 	struct list_head db;
@@ -132,7 +134,7 @@ void optee_handle_rpc(struct tee_context *ctx, struct optee_rpc_param *param,
 		      struct optee_call_ctx *call_ctx);
 void optee_rpc_finalize_call(struct optee_call_ctx *call_ctx);
 
-int optee_notif_init(struct optee *optee, u_int max_key);
+int optee_notif_init(struct optee *optee, u_int max_key, u_int irq);
 void optee_notif_uninit(struct optee *optee);
 int optee_notif_wait(struct optee *optee, u_int key);
 int optee_notif_send(struct optee *optee, u_int key);
@@ -159,6 +161,8 @@ int optee_close_session(struct tee_context *ctx, u32 session);
 int optee_invoke_func(struct tee_context *ctx, struct tee_ioctl_invoke_arg *arg,
 		      struct tee_param *param);
 int optee_cancel_req(struct tee_context *ctx, u32 cancel_id, u32 session);
+int optee_do_bottom_half(struct tee_context *ctx);
+int optee_stop_async_notif(struct tee_context *ctx);
 
 void optee_enable_shm_cache(struct optee *optee);
 void optee_disable_shm_cache(struct optee *optee);
diff --git a/drivers/tee/optee/optee_smc.h b/drivers/tee/optee/optee_smc.h
index 80eb763a8a80..c6eec6b6febf 100644
--- a/drivers/tee/optee/optee_smc.h
+++ b/drivers/tee/optee/optee_smc.h
@@ -107,6 +107,12 @@ struct optee_smc_call_get_os_revision_result {
 /*
  * Call with struct optee_msg_arg as argument
  *
+ * When calling this function normal world has a few responsibilities:
+ * 1. It must be able to handle eventual RPCs
+ * 2. Non-secure interrupts should not be masked
+ * 3. If asynchronous notifications has be negotiated successfully, then
+ *    asynchronous notifications should be unmasked during this call.
+ *
  * Call register usage:
  * a0	SMC Function ID, OPTEE_SMC*CALL_WITH_ARG
  * a1	Upper 32 bits of a 64-bit physical pointer to a struct optee_msg_arg
@@ -195,7 +201,8 @@ struct optee_smc_get_shm_config_result {
  * Normal return register usage:
  * a0	OPTEE_SMC_RETURN_OK
  * a1	bitfield of secure world capabilities OPTEE_SMC_SEC_CAP_*
- * a2-7	Preserved
+ * a2	The maximum secure world notification number
+ * a3-7	Preserved
  *
  * Error return register usage:
  * a0	OPTEE_SMC_RETURN_ENOTAVAIL, can't use the capabilities from normal world
@@ -218,6 +225,8 @@ struct optee_smc_get_shm_config_result {
 #define OPTEE_SMC_SEC_CAP_VIRTUALIZATION	BIT(3)
 /* Secure world supports Shared Memory with a NULL reference */
 #define OPTEE_SMC_SEC_CAP_MEMREF_NULL		BIT(4)
+/* Secure world supports asynchronous notification of normal world */
+#define OPTEE_SMC_SEC_CAP_ASYNC_NOTIF		BIT(5)
 
 #define OPTEE_SMC_FUNCID_EXCHANGE_CAPABILITIES	9
 #define OPTEE_SMC_EXCHANGE_CAPABILITIES \
@@ -226,8 +235,8 @@ struct optee_smc_get_shm_config_result {
 struct optee_smc_exchange_capabilities_result {
 	unsigned long status;
 	unsigned long capabilities;
+	unsigned long max_notif_value;
 	unsigned long reserved0;
-	unsigned long reserved1;
 };
 
 /*
@@ -319,6 +328,68 @@ struct optee_smc_disable_shm_cache_result {
 #define OPTEE_SMC_GET_THREAD_COUNT \
 	OPTEE_SMC_FAST_CALL_VAL(OPTEE_SMC_FUNCID_GET_THREAD_COUNT)
 
+/*
+ * Inform OP-TEE that normal world is able to receive asynchronous
+ * notifications.
+ *
+ * Call requests usage:
+ * a0	SMC Function ID, OPTEE_SMC_ENABLE_ASYNC_NOTIF
+ * a1-6	Not used
+ * a7	Hypervisor Client ID register
+ *
+ * Normal return register usage:
+ * a0	OPTEE_SMC_RETURN_OK
+ * a1-7	Preserved
+ *
+ * Not supported return register usage:
+ * a0	OPTEE_SMC_RETURN_ENOTAVAIL
+ * a1-7	Preserved
+ */
+#define OPTEE_SMC_FUNCID_ENABLE_ASYNC_NOTIF	16
+#define OPTEE_SMC_ENABLE_ASYNC_NOTIF \
+	OPTEE_SMC_FAST_CALL_VAL(OPTEE_SMC_FUNCID_ENABLE_ASYNC_NOTIF)
+
+/*
+ * Retrieve a value of notifications pended since the last call of this
+ * function.
+ *
+ * OP-TEE keeps a records of all posted values. When an interrupts is
+ * received which indicates that there are posed values this function
+ * should be called until all pended values has been retrieved. When a
+ * value is retrieved it's cleared from the record in secure world.
+ *
+ * Call requests usage:
+ * a0	SMC Function ID, OPTEE_SMC_GET_ASYNC_NOTIF_VALUE
+ * a1-6	Not used
+ * a7	Hypervisor Client ID register
+ *
+ * Normal return register usage:
+ * a0	OPTEE_SMC_RETURN_OK
+ * a1	value
+ * a2	Bit[0]: OPTEE_SMC_ASYNC_NOTIF_VALUE_VALID if the value in a1 is
+ *		valid, else 0 if no values where pending
+ * a2	Bit[1]: OPTEE_SMC_ASYNC_NOTIF_VALUE_PENDING if another value is
+ *		pending, else 0.
+ *	Bit[31:2]: MBZ
+ * a3-7	Preserved
+ *
+ * Not supported return register usage:
+ * a0	OPTEE_SMC_RETURN_ENOTAVAIL
+ * a1-7	Preserved
+ */
+#define OPTEE_SMC_ASYNC_NOTIF_VALUE_VALID	BIT(0)
+#define OPTEE_SMC_ASYNC_NOTIF_VALUE_PENDING	BIT(1)
+
+/*
+ * Notification that OP-TEE expects a yielding call to do some bottom half
+ * work in a driver.
+ */
+#define OPTEE_SMC_ASYNC_NOTIF_VALUE_DO_BOTTOM_HALF	0
+
+#define OPTEE_SMC_FUNCID_GET_ASYNC_NOTIF_VALUE	17
+#define OPTEE_SMC_GET_ASYNC_NOTIF_VALUE \
+	OPTEE_SMC_FAST_CALL_VAL(OPTEE_SMC_FUNCID_GET_ASYNC_NOTIF_VALUE)
+
 /*
  * Resume from RPC (for example after processing a foreign interrupt)
  *
-- 
2.31.1

