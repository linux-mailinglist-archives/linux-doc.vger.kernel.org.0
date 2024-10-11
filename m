Return-Path: <linux-doc+bounces-27280-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1ABC799ABE2
	for <lists+linux-doc@lfdr.de>; Fri, 11 Oct 2024 20:58:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 923731F25A7B
	for <lists+linux-doc@lfdr.de>; Fri, 11 Oct 2024 18:58:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 420911D150F;
	Fri, 11 Oct 2024 18:54:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="GmDB+U0v"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7AB21D04BE
	for <linux-doc@vger.kernel.org>; Fri, 11 Oct 2024 18:54:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728672888; cv=none; b=jbOTcYR2kbGDoEVx5rzF+9n5Qr/dUR1nazBN4ov8/3SmyKrOXZdmjeBnYI73tMmu6eFo3CAbEpvD8E4MgManYhMoC1U0Wuj3q9cwIeKPDntUBJfCXUVZtN4xSx1zF1StDSVnmuDLdin4MteKIlCk7XQo/I6xuqQJb2Gkp3xaUPQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728672888; c=relaxed/simple;
	bh=mo5nSpTL1mpJJWn0T0y9bjvmiNBacX4BLWzH1Oz6MfM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=H+lXRiPnjr9c5DXVb5PFU/7VaLx84Dqfu8E3UvmVMA1BGpUXyQbswdvsXcSnRzo42sn4gC3Dit1ElAeqpkTVV4nilsfdPxu0j/YNEI3h6DAceDvVvjBkCA3dd4vPuargiKng2dIjmaIVnuEd4RPeb7KcUZBTJhzPsm3zUhxq8qY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=GmDB+U0v; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-37cea34cb57so1422910f8f.0
        for <linux-doc@vger.kernel.org>; Fri, 11 Oct 2024 11:54:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1728672877; x=1729277677; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4Wcsu/BoMjTUXPdQVFWnBAqjwXxZAUnjwMCSCOoMsVU=;
        b=GmDB+U0v3pGEOuMXnP75axNhqK3Mk2RDsFZe6/nnFuVRRB91lejFhJAXbxh+0DPXEB
         ZQX+cgIwNNIHTxeSfS6Yd/Wp1ygOYTUnCAcHK5skGhUPcemv4zIGVAroMn6kSEf3VXQA
         ZO6AGLSdObmYhDK3w85a/tRNQnbo1gFrtgsZDpwIfCwrsor/8pE0oMmsMF/ZXplaDXhZ
         r3YpHblCZ62590niXPGnSwCoTFSQwLWInc2+2Kk66iv9GCLpTe/1+QoDQf7G6JSbETgB
         UiTyHNSvZJ52csBjv6Vu6Ly047AR+SpABHgtX+lS2sgRNy1bfwnB7wdqKq9O75YBzRnh
         Wmjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728672877; x=1729277677;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4Wcsu/BoMjTUXPdQVFWnBAqjwXxZAUnjwMCSCOoMsVU=;
        b=Z8zamz5ISCHBKuf3fgc8Q8JAvcMli+cGvL8abNb6uh19Qu0x/KzxYXjhfpMznQVyFX
         badJbhBATW6o+FmUNI9p4pkwtdd6kHOE0+7QoYMhpbqpIMT4uaEqT330rXzN4r+rrwrY
         ac6O0/cJISIvGuXH8vHBB4E4Okz33h7eZ6tb9MA88fnfCaO6S6RKn50pIuP5db0Gd4AS
         FlGKcnW6W4UBjgLo0qvo/An066zn3pYdQ4QFDBxamxnHTaCXx2GC87XH6OxhZ3J0v+MJ
         776p6gaeRdQzNNm34r3qSHRWzXqQnZOeEBRRmXcFLU35ieiez3wZSq1YBA6qQ89Jqeul
         zI6g==
X-Forwarded-Encrypted: i=1; AJvYcCUSyHMmmiyX/AQFwftKKx70+4674f2oyu8612zeu2TphPVtxHFqjnZu/TYp0Dy/tfQ09uW0DB+PUo0=@vger.kernel.org
X-Gm-Message-State: AOJu0YxBKxkYnOUw43jOXg3BQKSqDdCVHPPrftrOroAasZWitIoP8CXP
	H+nDrareewCO5TijyVc5Flyj1hKYL8KOEfp2ILcs4nFZA+Fqa6d1/74kGr3tMa8=
X-Google-Smtp-Source: AGHT+IGJRtphPqQxoohXNT7jWzpAxRyc8QWyHB5IpQBS4Uxzri1qnnK+OyqNQYC9Dlk/8fepYxnZqg==
X-Received: by 2002:a5d:4d4a:0:b0:37d:4527:ba1c with SMTP id ffacd0b85a97d-37d5531a0a2mr2265033f8f.49.1728672877197;
        Fri, 11 Oct 2024 11:54:37 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:68b8:bef:b7eb:538f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37d4b79fe7csm4559161f8f.70.2024.10.11.11.54.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Oct 2024 11:54:36 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Fri, 11 Oct 2024 20:54:05 +0200
Subject: [PATCH v7 06/17] firmware: qcom: scm: add a call for deriving the
 software secret
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241011-wrapped-keys-v7-6-e3f7a752059b@linaro.org>
References: <20241011-wrapped-keys-v7-0-e3f7a752059b@linaro.org>
In-Reply-To: <20241011-wrapped-keys-v7-0-e3f7a752059b@linaro.org>
To: Jens Axboe <axboe@kernel.dk>, Jonathan Corbet <corbet@lwn.net>, 
 Alasdair Kergon <agk@redhat.com>, Mike Snitzer <snitzer@kernel.org>, 
 Mikulas Patocka <mpatocka@redhat.com>, 
 Adrian Hunter <adrian.hunter@intel.com>, 
 Asutosh Das <quic_asutoshd@quicinc.com>, 
 Ritesh Harjani <ritesh.list@gmail.com>, 
 Ulf Hansson <ulf.hansson@linaro.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Avri Altman <avri.altman@wdc.com>, Bart Van Assche <bvanassche@acm.org>, 
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>, 
 "Martin K. Petersen" <martin.petersen@oracle.com>, 
 Eric Biggers <ebiggers@kernel.org>, "Theodore Y. Ts'o" <tytso@mit.edu>, 
 Jaegeuk Kim <jaegeuk@kernel.org>, Alexander Viro <viro@zeniv.linux.org.uk>, 
 Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Gaurav Kashyap <quic_gaurkash@quicinc.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>
Cc: linux-block@vger.kernel.org, linux-doc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, dm-devel@lists.linux.dev, 
 linux-mmc@vger.kernel.org, linux-scsi@vger.kernel.org, 
 linux-fscrypt@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=4695;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=ENWj0XXoRMUHozAURbUmYvdkrtvsQDUyvPd8uYMRh8g=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBnCXRd+XGr6al4uOgJo7BV6uBYWZBSMD7qzVQ0E
 V8+Hic+dlyJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCZwl0XQAKCRARpy6gFHHX
 ckIxEADQN44/Z+EkIi7nPzdOyuBr39lwQhprzHZAE44Ha2zq+j8DRjjBRWzCQFT49F9N2v/18zn
 M6+0kg08r8t1FeTBnSX+qxU2Mj47YRkUeAWJnTb1FocoJDf+o42TRORhFb3DCdJsCP/m1zqaIFD
 xdY+pbui5IXjGk0+Bf4LIUyIPdJj6J+kLvBEleoOZtjl+3q35YLawYYWPIowUjP0xvZIf+fYGQ2
 HeO6MfS2/ztGuVDcAfDQ4ezMHMnh1i4nQqNeNomY6zIqgvvmdn3Iy7HQ2HZvocg1Zbnr+59aM1M
 DF6/dwYg021Vm5FtIHFpnj2TNVpQqObSg0RaK20ht8Ak607vNjFncCORRYzNY2jkVbdQZ1PLXa7
 mBX2iaWk65PAOUG/PDiidPEwmhbnGSC7CKNxNeVwygINv0//M4NHOu6LatO7uX5DMcmUtIHFtdi
 SQApLuH3oyOo8Op8zmhNLl/UXewgMJeyUxxSLMJ9c7JIuKBpCdij9IFTGLBPqvVTj3gdCuC6agl
 KszKrPtk9TNyQ0zvwjQ+Wx2tlN9/mBEDnYQ8ZDqwOGS9QmW3EPW6edbRtq79ZzfgvaiGNBUM6yB
 591vPuaYzAwSGiWgSPdWADhem9W9DwxYcmbv6w8BhoRERNajoJClgft8rVtmuNrZdOW3TYTljTt
 omvxX48juAN4xtQ==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Gaurav Kashyap <quic_gaurkash@quicinc.com>

Inline storage encryption may require deriving a software secret from
storage keys added to the kernel.

For raw keys, this can be directly done in the kernel as keys are not
encrypted in memory.

However, hardware wrapped keys can only be unwrapped by the HW wrapping
entity. In case of Qualcomm's wrapped key solution, this is done by the
Hardware Key Manager (HWKM) from Trustzone.

Add a new SCM call which provides a hook to the software secret crypto
profile API provided by the block layer.

Tested-by: Neil Armstrong <neil.armstrong@linaro.org>
Signed-off-by: Gaurav Kashyap <quic_gaurkash@quicinc.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/firmware/qcom/qcom_scm.c       | 65 ++++++++++++++++++++++++++++++++++
 drivers/firmware/qcom/qcom_scm.h       |  1 +
 include/linux/firmware/qcom/qcom_scm.h |  2 ++
 3 files changed, 68 insertions(+)

diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
index ebb58bd63eda..de90d21c2dfa 100644
--- a/drivers/firmware/qcom/qcom_scm.c
+++ b/drivers/firmware/qcom/qcom_scm.c
@@ -1252,6 +1252,71 @@ int qcom_scm_ice_set_key(u32 index, const u8 *key, u32 key_size,
 }
 EXPORT_SYMBOL_GPL(qcom_scm_ice_set_key);
 
+/**
+ * qcom_scm_derive_sw_secret() - Derive software secret from wrapped key
+ * @wkey: the hardware wrapped key inaccessible to software
+ * @wkey_size: size of the wrapped key
+ * @sw_secret: the secret to be derived which is exactly the secret size
+ * @sw_secret_size: size of the sw_secret
+ *
+ * Derive a software secret from a hardware wrapped key for software crypto
+ * operations.
+ * For wrapped keys, the key needs to be unwrapped, in order to derive a
+ * software secret, which can be done in the hardware from a secure execution
+ * environment.
+ *
+ * For more information on sw secret, please refer to "Hardware-wrapped keys"
+ * section of Documentation/block/inline-encryption.rst.
+ *
+ * Return: 0 on success; -errno on failure.
+ */
+int qcom_scm_derive_sw_secret(const u8 *wkey, size_t wkey_size,
+			      u8 *sw_secret, size_t sw_secret_size)
+{
+	struct qcom_scm_desc desc = {
+		.svc = QCOM_SCM_SVC_ES,
+		.cmd =  QCOM_SCM_ES_DERIVE_SW_SECRET,
+		.arginfo = QCOM_SCM_ARGS(4, QCOM_SCM_RW,
+					 QCOM_SCM_VAL, QCOM_SCM_RW,
+					 QCOM_SCM_VAL),
+		.args[1] = wkey_size,
+		.args[3] = sw_secret_size,
+		.owner = ARM_SMCCC_OWNER_SIP,
+	};
+
+	int ret;
+
+	void *wkey_buf __free(qcom_tzmem) = qcom_tzmem_alloc(__scm->mempool,
+							    wkey_size,
+							    GFP_KERNEL);
+	if (!wkey_buf)
+		return -ENOMEM;
+
+	void *secret_buf __free(qcom_tzmem) = qcom_tzmem_alloc(__scm->mempool,
+							       sw_secret_size,
+							       GFP_KERNEL);
+	if (!secret_buf) {
+		ret = -ENOMEM;
+		goto out_free_wrapped;
+	}
+
+	memcpy(wkey_buf, wkey, wkey_size);
+	desc.args[0] = qcom_tzmem_to_phys(wkey_buf);
+	desc.args[2] = qcom_tzmem_to_phys(secret_buf);
+
+	ret = qcom_scm_call(__scm->dev, &desc, NULL);
+	if (!ret)
+		memcpy(sw_secret, secret_buf, sw_secret_size);
+
+	memzero_explicit(secret_buf, sw_secret_size);
+
+out_free_wrapped:
+	memzero_explicit(wkey_buf, wkey_size);
+
+	return ret;
+}
+EXPORT_SYMBOL_GPL(qcom_scm_derive_sw_secret);
+
 /**
  * qcom_scm_hdcp_available() - Check if secure environment supports HDCP.
  *
diff --git a/drivers/firmware/qcom/qcom_scm.h b/drivers/firmware/qcom/qcom_scm.h
index 685b8f59e7a6..5a98b90ece32 100644
--- a/drivers/firmware/qcom/qcom_scm.h
+++ b/drivers/firmware/qcom/qcom_scm.h
@@ -127,6 +127,7 @@ struct qcom_tzmem_pool *qcom_scm_get_tzmem_pool(void);
 #define QCOM_SCM_SVC_ES			0x10	/* Enterprise Security */
 #define QCOM_SCM_ES_INVALIDATE_ICE_KEY	0x03
 #define QCOM_SCM_ES_CONFIG_SET_ICE_KEY	0x04
+#define QCOM_SCM_ES_DERIVE_SW_SECRET	0x07
 
 #define QCOM_SCM_SVC_HDCP		0x11
 #define QCOM_SCM_HDCP_INVOKE		0x01
diff --git a/include/linux/firmware/qcom/qcom_scm.h b/include/linux/firmware/qcom/qcom_scm.h
index 9f14976399ab..0ef4415e2023 100644
--- a/include/linux/firmware/qcom/qcom_scm.h
+++ b/include/linux/firmware/qcom/qcom_scm.h
@@ -103,6 +103,8 @@ bool qcom_scm_ice_available(void);
 int qcom_scm_ice_invalidate_key(u32 index);
 int qcom_scm_ice_set_key(u32 index, const u8 *key, u32 key_size,
 			 enum qcom_scm_ice_cipher cipher, u32 data_unit_size);
+int qcom_scm_derive_sw_secret(const u8 *wkey, size_t wkey_size,
+			      u8 *sw_secret, size_t sw_secret_size);
 
 bool qcom_scm_hdcp_available(void);
 int qcom_scm_hdcp_req(struct qcom_scm_hdcp_req *req, u32 req_cnt, u32 *resp);

-- 
2.43.0


