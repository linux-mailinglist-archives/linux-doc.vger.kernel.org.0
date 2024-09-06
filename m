Return-Path: <linux-doc+bounces-24706-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1955B96FACD
	for <lists+linux-doc@lfdr.de>; Fri,  6 Sep 2024 20:10:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C3D0D289D59
	for <lists+linux-doc@lfdr.de>; Fri,  6 Sep 2024 18:10:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B18891E975A;
	Fri,  6 Sep 2024 18:07:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="Butb87UE"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83F7E1E6DF6
	for <linux-doc@vger.kernel.org>; Fri,  6 Sep 2024 18:07:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725646068; cv=none; b=mXii9ZjwwqxdvUthYhopZbvM0f4OBRTOZSYgKmfBf2cs2/fZcNoomveyJYE9lNlozhZKEf7TuX87uEZO8Z3bN5EyF98JekyCreC6wdiaDK/vuDhG8R0VxGKzfV+WWsWdI+/tvijUB9WqZnU+i8gwcqJYKWye+ZbrPEkFJBkcCcY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725646068; c=relaxed/simple;
	bh=EqVr4F8kvFNxChk4YQazp+8dZ6/1G6/LBuNToIpPjEs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rno3AzDe81BlGsEeJCjEHpw3JzxP9ItCpNvCuBo2Rn2KwPFOWSi8cKcYVYLsVV64TKovI5Wsnl4spShWr9PAEUeWQhqFPGCUFfVgyliZ+/DfKK4FMmgY4B/Y4e5XkdBbp6vEtS8ClZWO38NPfdRWtE7huegKZ4aK6IAtQXpfIiA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=Butb87UE; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-374d29ad870so1267282f8f.3
        for <linux-doc@vger.kernel.org>; Fri, 06 Sep 2024 11:07:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1725646062; x=1726250862; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mYzuw7cEbIrwBw5NmVT59ZbR37fGGaDPeX4Yi7zrnBA=;
        b=Butb87UEOwZp5NACX6M6rGTxVMS53IePKFMXAJ1MRU/++E5Ng0PHtk6qAXSEmPJ57/
         jUEZTK42da40fduFThOnwlcVK1YSMPt6XGrp2LSp97skS2LV3bBkc3gmjvSVNALo3Mnb
         ZvH696IjVyntdPfTfR5uhsrK3jhS8DwG71h54c987xp6PkG6NlFDIbCZfTf2/RTFHklI
         BkjEP9j/FVnfuoliFrEgwpny0eXu4Ui6WBgWOF12zhNAcvRZj8YNwVMh0RlKq4GvijgN
         5vv3sR/hVEbAhrdRUdp5uhsKOGeHpF8QTYAobQWu2c+X/44+VYBAVWVr5WCQ39y/Mt2v
         RFQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725646062; x=1726250862;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mYzuw7cEbIrwBw5NmVT59ZbR37fGGaDPeX4Yi7zrnBA=;
        b=g1cG1bOvtyCYvYINP4qD3w8FnU93Gos2lf9vH0JK4LwB2OkTq/3KqqoaGugSkohMHV
         5mihY03/mNZ2oR4+/r9ded9uaO23bxxJQ2ULMNoo+zy8HqJT4aWRNNs4Sy/U25TgKpNH
         GvNyMNo9Nx1agggIT/nF0XGxWQ4CpDDtc109TBVEeGNJ0/r+KgLjycJXPf9bXkmGxhxv
         rFjINZ+W1p2jwOmDZ6s/UV0GL0VvbSdgg9Ejswx8KmydZRuEBOsXCvsDj7MDvbYJfu6U
         cq4vzCIntIZEQXgT7Lud3cNdw9Wpzc4P2fNBEX4otXt3WkKE6gWuLYl+TsSp+6ksvtIE
         2xCQ==
X-Forwarded-Encrypted: i=1; AJvYcCXEXXXN4jPUtxaZsG+IAm+6iVnW8ooIx9h+7atY+OZAfPE4YQA04k0PlFiyMDSFTzoOgGtzJZs6qpI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxjo6vShaKOBphq3LehJy5deAQK5q4Ma5g9Qz6Hpx0AxtisL56f
	0q2Qi531WtlUjJ/2+wyqHpvCwnQUHwmxnTZEyy+EyS6ajy8JZQOr1d8JUv8Ksm8=
X-Google-Smtp-Source: AGHT+IECNnXj1KizF/4Z+Q8IwWK8pdszuVEKGN68IASzAAQvLVmk26R3mTC+91UHHkXikyZ/agTdpw==
X-Received: by 2002:adf:edc2:0:b0:374:ba70:5527 with SMTP id ffacd0b85a97d-378895c70dfmr2331780f8f.13.1725646061769;
        Fri, 06 Sep 2024 11:07:41 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:b9fc:a1e7:588c:1e37])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42cac8543dbsm5880485e9.42.2024.09.06.11.07.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Sep 2024 11:07:41 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Fri, 06 Sep 2024 20:07:13 +0200
Subject: [PATCH v6 10/17] soc: qcom: ice: add support for hardware wrapped
 keys
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240906-wrapped-keys-v6-10-d59e61bc0cb4@linaro.org>
References: <20240906-wrapped-keys-v6-0-d59e61bc0cb4@linaro.org>
In-Reply-To: <20240906-wrapped-keys-v6-0-d59e61bc0cb4@linaro.org>
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
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, 
 Om Prakash Singh <quic_omprsing@quicinc.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=7694;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=LrUgdansRGK+tn2hYrPlj+soG7U7JYhBBOh6LdEpca8=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBm20TYlQcNT1+UlAZ1Y7Jki+fEyXoqjgmvta4IQ
 TjFnA0m9iqJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCZttE2AAKCRARpy6gFHHX
 chQnEACf/q6nYd1b08J5B7ik8UMdsQYVi0WKKg+swgrG+/pdk2brX3NoU1W0+NBtYaRCbU3eEyd
 4TM8o98mTp2SETAVT8a3BgagCQiZObyvQ4zVrsN9zYlnx7vHlfNaA4fONFTlOEFOy+30mz9GnPB
 0xnMlaNRe8ukNvUsJga6atyr/UuYYmnhy1qV3XMUceZBGDUGz7cXPTpR3zGBTnimLJ2mKPRj3sN
 Ow+JuHvg7+dKe8ZQf8i0RUB7V6Ff/P8ShyVx1GrVk4+Oliyq5+dCWKDu3w+Hh1fi3w4LBmy5X1K
 T5FJyBGyvxY+jjUl68+ry6+b27EydH8lkOaM7WzRicUAS5j+EC/3I8mm/Yse3gPHHvp+Mf5iDHm
 RPWcYQz3OoemsxhlClkbLHOhVeC2bva/VN2eP7lV5637Dp6Ks2us1GhJV82JPGFJdpldLkdICUI
 lOdkbCwZf+Q+hlQDW+cCZg8yIdPacthGySFp3IAfbj8RPd1V8sWR+a1WspF3YcuTEtqhPQqiZyJ
 Uc5I5jEUypoDb25FubWJJtZWCDAgJEilEXGFqsvmlYgB4rGCSKta1OZx0XwN/Hto0cyWqh6uEae
 SNFJR/CZm66Wjg5tl65eiqrwlWemkMbWmOpa2m3ufjmReULJnj67oGoPs+A2G5j8xA7OCi8dLqq
 HRJuHc7BDF7ytXQ==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Gaurav Kashyap <quic_gaurkash@quicinc.com>

Now that HWKM support has been added to ICE, extend the ICE driver to
support hardware wrapped keys programming coming in from the storage
controllers (UFS and eMMC). This is similar to raw keys where the call is
forwarded to Trustzone, however we also need to clear and re-enable
CFGE before and after programming the key.

Derive software secret support is also added by forwarding the call to
the corresponding SCM API.

Tested-by: Neil Armstrong <neil.armstrong@linaro.org>
Reviewed-by: Om Prakash Singh <quic_omprsing@quicinc.com>
Signed-off-by: Gaurav Kashyap <quic_gaurkash@quicinc.com>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/soc/qcom/ice.c | 121 ++++++++++++++++++++++++++++++++++++++++++++-----
 include/soc/qcom/ice.h |   4 ++
 2 files changed, 114 insertions(+), 11 deletions(-)

diff --git a/drivers/soc/qcom/ice.c b/drivers/soc/qcom/ice.c
index 667d993694ac..4ed64845455f 100644
--- a/drivers/soc/qcom/ice.c
+++ b/drivers/soc/qcom/ice.c
@@ -28,6 +28,8 @@
 #define QCOM_ICE_REG_BIST_STATUS		0x0070
 #define QCOM_ICE_REG_ADVANCED_CONTROL		0x1000
 #define QCOM_ICE_REG_CONTROL			0x0
+#define QCOM_ICE_LUT_KEYS_CRYPTOCFG_R16		0x4040
+
 /* QCOM ICE HWKM registers */
 #define QCOM_ICE_REG_HWKM_TZ_KM_CTL			0x1000
 #define QCOM_ICE_REG_HWKM_TZ_KM_STATUS			0x1004
@@ -69,6 +71,8 @@
 #define QCOM_ICE_FORCE_HW_KEY0_SETTING_MASK	0x2
 #define QCOM_ICE_FORCE_HW_KEY1_SETTING_MASK	0x4
 
+#define QCOM_ICE_LUT_KEYS_CRYPTOCFG_OFFSET	0x80
+
 #define QCOM_ICE_HWKM_REG_OFFSET	0x8000
 #define HWKM_OFFSET(reg)		((reg) + QCOM_ICE_HWKM_REG_OFFSET)
 
@@ -78,6 +82,10 @@
 #define qcom_ice_readl(engine, reg)	\
 	readl((engine)->base + (reg))
 
+#define QCOM_ICE_LUT_CRYPTOCFG_SLOT_OFFSET(slot) \
+	(QCOM_ICE_LUT_KEYS_CRYPTOCFG_R16 + \
+	 QCOM_ICE_LUT_KEYS_CRYPTOCFG_OFFSET * slot)
+
 struct qcom_ice {
 	struct device *dev;
 	void __iomem *base;
@@ -89,6 +97,16 @@ struct qcom_ice {
 	bool hwkm_init_complete;
 };
 
+union crypto_cfg {
+	__le32 regval;
+	struct {
+		u8 dusize;
+		u8 capidx;
+		u8 reserved;
+		u8 cfge;
+	};
+};
+
 static bool qcom_ice_check_supported(struct qcom_ice *ice)
 {
 	u32 regval = qcom_ice_readl(ice, QCOM_ICE_REG_VERSION);
@@ -299,6 +317,47 @@ int qcom_ice_suspend(struct qcom_ice *ice)
 }
 EXPORT_SYMBOL_GPL(qcom_ice_suspend);
 
+/*
+ * For v1 the ICE slot will be calculated in the trustzone.
+ */
+static int translate_hwkm_slot(struct qcom_ice *ice, int slot)
+{
+	return (ice->hwkm_version == 1) ? slot : (slot * 2);
+}
+
+static int qcom_ice_program_wrapped_key(struct qcom_ice *ice,
+					const struct blk_crypto_key *key,
+					u8 data_unit_size, int slot)
+{
+	union crypto_cfg cfg;
+	int hwkm_slot;
+	int err;
+
+	hwkm_slot = translate_hwkm_slot(ice, slot);
+
+	memset(&cfg, 0, sizeof(cfg));
+	cfg.dusize = data_unit_size;
+	cfg.capidx = QCOM_SCM_ICE_CIPHER_AES_256_XTS;
+	cfg.cfge = 0x80;
+
+	/* Clear CFGE */
+	qcom_ice_writel(ice, 0x0, QCOM_ICE_LUT_CRYPTOCFG_SLOT_OFFSET(slot));
+
+	/* Call trustzone to program the wrapped key using hwkm */
+	err = qcom_scm_ice_set_key(hwkm_slot, key->raw, key->size,
+				   QCOM_SCM_ICE_CIPHER_AES_256_XTS, data_unit_size);
+	if (err) {
+		pr_err("%s:SCM call Error: 0x%x slot %d\n", __func__, err,
+		       slot);
+		return err;
+	}
+
+	/* Enable CFGE after programming key */
+	qcom_ice_writel(ice, cfg.regval, QCOM_ICE_LUT_CRYPTOCFG_SLOT_OFFSET(slot));
+
+	return err;
+}
+
 int qcom_ice_program_key(struct qcom_ice *ice,
 			 u8 algorithm_id, u8 key_size,
 			 const struct blk_crypto_key *bkey,
@@ -314,24 +373,39 @@ int qcom_ice_program_key(struct qcom_ice *ice,
 
 	/* Only AES-256-XTS has been tested so far. */
 	if (algorithm_id != QCOM_ICE_CRYPTO_ALG_AES_XTS ||
-	    key_size != QCOM_ICE_CRYPTO_KEY_SIZE_256) {
+	    (key_size != QCOM_ICE_CRYPTO_KEY_SIZE_256 &&
+	    key_size != QCOM_ICE_CRYPTO_KEY_SIZE_WRAPPED)) {
 		dev_err_ratelimited(dev,
 				    "Unhandled crypto capability; algorithm_id=%d, key_size=%d\n",
 				    algorithm_id, key_size);
 		return -EINVAL;
 	}
 
-	memcpy(key.bytes, bkey->raw, AES_256_XTS_KEY_SIZE);
+	if (bkey->crypto_cfg.key_type == BLK_CRYPTO_KEY_TYPE_HW_WRAPPED) {
+		/* It is expected that HWKM init has completed before programming wrapped keys */
+		if (!ice->use_hwkm || !ice->hwkm_init_complete) {
+			dev_err_ratelimited(dev, "HWKM not currently used or initialized\n");
+			return -EINVAL;
+		}
+		err = qcom_ice_program_wrapped_key(ice, bkey, data_unit_size,
+						   slot);
+	} else {
+		if (bkey->size != QCOM_ICE_CRYPTO_KEY_SIZE_256)
+			dev_err_ratelimited(dev,
+					    "Incorrect key size; bkey->size=%d\n",
+					    algorithm_id);
+		return -EINVAL;
+		memcpy(key.bytes, bkey->raw, AES_256_XTS_KEY_SIZE);
 
-	/* The SCM call requires that the key words are encoded in big endian */
-	for (i = 0; i < ARRAY_SIZE(key.words); i++)
-		__cpu_to_be32s(&key.words[i]);
+		/* The SCM call requires that the key words are encoded in big endian */
+		for (i = 0; i < ARRAY_SIZE(key.words); i++)
+			__cpu_to_be32s(&key.words[i]);
 
-	err = qcom_scm_ice_set_key(slot, key.bytes, AES_256_XTS_KEY_SIZE,
-				   QCOM_SCM_ICE_CIPHER_AES_256_XTS,
-				   data_unit_size);
-
-	memzero_explicit(&key, sizeof(key));
+		err = qcom_scm_ice_set_key(slot, key.bytes, AES_256_XTS_KEY_SIZE,
+					   QCOM_SCM_ICE_CIPHER_AES_256_XTS,
+					   data_unit_size);
+		memzero_explicit(&key, sizeof(key));
+	}
 
 	return err;
 }
@@ -339,7 +413,23 @@ EXPORT_SYMBOL_GPL(qcom_ice_program_key);
 
 int qcom_ice_evict_key(struct qcom_ice *ice, int slot)
 {
-	return qcom_scm_ice_invalidate_key(slot);
+	int hwkm_slot = slot;
+
+	if (ice->use_hwkm) {
+		hwkm_slot = translate_hwkm_slot(ice, slot);
+
+		/*
+		 * Ignore calls to evict key when HWKM is supported and hwkm
+		 * init is not yet done. This is to avoid the clearing all
+		 * slots call during a storage reset when ICE is still in
+		 * legacy mode. HWKM slave in ICE takes care of zeroing out
+		 * the keytable on reset.
+		 */
+		if (!ice->hwkm_init_complete)
+			return 0;
+	}
+
+	return qcom_scm_ice_invalidate_key(hwkm_slot);
 }
 EXPORT_SYMBOL_GPL(qcom_ice_evict_key);
 
@@ -349,6 +439,15 @@ bool qcom_ice_hwkm_supported(struct qcom_ice *ice)
 }
 EXPORT_SYMBOL_GPL(qcom_ice_hwkm_supported);
 
+int qcom_ice_derive_sw_secret(struct qcom_ice *ice, const u8 wkey[],
+			      unsigned int wkey_size,
+			      u8 sw_secret[BLK_CRYPTO_SW_SECRET_SIZE])
+{
+	return qcom_scm_derive_sw_secret(wkey, wkey_size,
+					 sw_secret, BLK_CRYPTO_SW_SECRET_SIZE);
+}
+EXPORT_SYMBOL_GPL(qcom_ice_derive_sw_secret);
+
 static struct qcom_ice *qcom_ice_create(struct device *dev,
 					void __iomem *base)
 {
diff --git a/include/soc/qcom/ice.h b/include/soc/qcom/ice.h
index 1f52e82e3e1c..dabe0d3a1fd0 100644
--- a/include/soc/qcom/ice.h
+++ b/include/soc/qcom/ice.h
@@ -17,6 +17,7 @@ enum qcom_ice_crypto_key_size {
 	QCOM_ICE_CRYPTO_KEY_SIZE_192		= 0x2,
 	QCOM_ICE_CRYPTO_KEY_SIZE_256		= 0x3,
 	QCOM_ICE_CRYPTO_KEY_SIZE_512		= 0x4,
+	QCOM_ICE_CRYPTO_KEY_SIZE_WRAPPED	= 0x5,
 };
 
 enum qcom_ice_crypto_alg {
@@ -35,5 +36,8 @@ int qcom_ice_program_key(struct qcom_ice *ice,
 			 u8 data_unit_size, int slot);
 int qcom_ice_evict_key(struct qcom_ice *ice, int slot);
 bool qcom_ice_hwkm_supported(struct qcom_ice *ice);
+int qcom_ice_derive_sw_secret(struct qcom_ice *ice, const u8 wkey[],
+			      unsigned int wkey_size,
+			      u8 sw_secret[BLK_CRYPTO_SW_SECRET_SIZE]);
 struct qcom_ice *of_qcom_ice_get(struct device *dev);
 #endif /* __QCOM_ICE_H__ */

-- 
2.43.0


