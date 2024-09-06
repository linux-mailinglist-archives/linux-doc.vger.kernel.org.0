Return-Path: <linux-doc+bounces-24709-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 671C396FAF2
	for <lists+linux-doc@lfdr.de>; Fri,  6 Sep 2024 20:12:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9532AB25F75
	for <lists+linux-doc@lfdr.de>; Fri,  6 Sep 2024 18:12:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 79F341EB936;
	Fri,  6 Sep 2024 18:07:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="XHCgNQQI"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 197811D86C6
	for <linux-doc@vger.kernel.org>; Fri,  6 Sep 2024 18:07:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725646074; cv=none; b=CIx0jyw+QwFJwfIUNwmyo1+hD7yJn9GT/1PSVAUC5XYilsRdvzN9gG4LY9acY0nrtxuy/tmcgtB0+5S/uxDhrUc51dhwbeNRsXpcAKqg4g1GOxGXBLom2cE15rgdMhd+CCRDw5KsivEqRTiN2muTZxo4CiMUSzu7aBxYVf5BRu8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725646074; c=relaxed/simple;
	bh=OiTQs/o4iIOclq2/II8GFOi7yVE7fd4Ofbj0SHeNToU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WBYIe+TA9M/2Y7N0zmHxdKru5pMGTGfDoheQO3/k6sWMx6x6ja0uD8GWItRcyOz5VWoT63Z3o7TdFoJ5LS3liZ+SjHKq0KGCGwV3sYJdz/wu2i46OHe863F0A/W7/T3jnYVJgk5RD5ldnvsKclZHXPtWQsgfUmG8j+3qx2noamA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=XHCgNQQI; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-3770320574aso1286605f8f.2
        for <linux-doc@vger.kernel.org>; Fri, 06 Sep 2024 11:07:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1725646067; x=1726250867; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cUF38RhJP/xWJ3nsoL8I4l8UYROpqB3e6odW9g8ieUo=;
        b=XHCgNQQIi64gnVEjNfcp+yl37cw0xskjhCczQGr1QdeWkYfJnMotAtezV5WS3qSpuH
         kAGPATgtBR+EIBrsYQppLi0v7dYwuJCUNo1g+tDC5D9lkKFTcG+o1B1WCwB/U0O7oPrS
         G2sJsGDMv57QrzI00uVlD/F/hTzvJo6fxd7qt5850/d41MLlDckihOxb6rAj8xmJcVAR
         o8tytnk9hj9BxzCOYXvHsOKZFuzWpNx2S/BleQ48DIWa91vXKbULqjhdzytFedGgJGyk
         bbpm7BkMGXLVWMop0zjC3lDaH2vPm83p6i+ZXUNeC3V/VjCQn080hvjaMk6zba3rhWb/
         7P8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725646067; x=1726250867;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cUF38RhJP/xWJ3nsoL8I4l8UYROpqB3e6odW9g8ieUo=;
        b=TWGdnk6TTkIK1oaZMFF5fffHpFFGy2Y5GLqg0ROC3zYQUyl4XTi5n8akQ8fAOC23oG
         5sR6G/JzdRrRaOcrzr51+7V2jeYSEKAPSLyKvumilahmgEl6Q/XB7nm17FXyOMwsB7p9
         1LkMNlA9U/QJt1ueZPDwmaAjNt4LLtDeAH27eXG99zP5vT2ckaZXVxFdMMQNxrn3Rko+
         aQ475gMPb3r4vQraL83/dS6etCu/smejf/F3kTHaGyd3wp8z32KMN3IC4rVb/Xm+9CoO
         sng39A+kHspZxLWMv/atcyhQQV0toJacvjmOXZq3oy350DNryeGZPXV/SPRnvKvDrIoP
         AGbg==
X-Forwarded-Encrypted: i=1; AJvYcCUICpmTv/wpd8XljVPqfxIJiYEDKzownC4TUG3S9MxbDDBAyb1tSRuhLQNIckIK9Cwj6vWzCZexa70=@vger.kernel.org
X-Gm-Message-State: AOJu0YyUsoo+TZZBVLLpoaUwu8Le3bNz0Qq5cxGjm0AFv0fEd4I1gued
	eT4TL3vInNWb5KVLgQvKYa4MZ2eKQnWJaIJemwJa3NKa8QcCra2MqBlPUWPrW9Q=
X-Google-Smtp-Source: AGHT+IG36Xih85G9y6Nb2G00mKL7EauJKzGTn4BsvgwP+Z5ieQBsVHrZEkvhof1vQ3Rntfk5UrZTKw==
X-Received: by 2002:a05:6000:25c:b0:374:c10c:83b3 with SMTP id ffacd0b85a97d-3788969fcd7mr1651689f8f.54.1725646066564;
        Fri, 06 Sep 2024 11:07:46 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:b9fc:a1e7:588c:1e37])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42cac8543dbsm5880485e9.42.2024.09.06.11.07.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Sep 2024 11:07:46 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Fri, 06 Sep 2024 20:07:16 +0200
Subject: [PATCH v6 13/17] ufs: core: add support for deriving the software
 secret
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240906-wrapped-keys-v6-13-d59e61bc0cb4@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2593;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=+O4fdu9GZr4J7nzYrJhbrNMvxA5VEGSdndPo0S5CrQM=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBm20TZrb3SHTwnz2R7Nx9OI32Q36SvL7ZwpgbGD
 YFfJMdVbNqJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCZttE2QAKCRARpy6gFHHX
 ci/dD/9vIw3Bysghw6DNsGzax+I8Q+JSgmwIExWkyla62bo+JWEAe99yQmscgZS5oWTQCA3IWtE
 VxO7rS3jTU1RCL42YIwVNviK8ZWYAR5IYhenr3R6V4cEjM93xBl1utGkIfWPNRFKKm9d6SR3nQT
 u+HC7Yzm3euXtBQiDvbxo6eH6J9ItprVKFJzp4nnfSmO1n+EWJ57THoTdhDLxjhRzoNIAasEfUS
 HDLfgOJTMU6je+t03Mc02YUkkWq7fzXpRy4oXUrYvMfro6gAxB/G38cN3ZlFH/pKuxfgKsgshM8
 nfEty/c98oY/K8IFcgK1XHEq3hCT6El93sN6v+xb0LcW4DbGPTIZQT1vnCtZGDXB9RsgLboRfoJ
 yBYdUB3vsXv/ZaJYWR6qoomYLfx2ERvH5zmeOqBrr1UKKL2ex3rYKHShos53Y8UaezCUcdSTcAy
 g/WT8uxgDTzwol0cDSNw/diMeL1OHmdVWvk3le6njkLekem243syTH0gDd/Sb7tzCWBD0NPjEfI
 OhW3QdsgPJqXjBAQTl2zgxRJB2Bv099uzeNKiEt0Tz2WBJeVcoC18r3EMx069dbFJaUb54rc+tE
 2nvXxTTTe/BNrdWmlTx9ai1N/TrQHl/eA3ryyCZDCrePus1cG7foS0lOMUdZ6q2x7tx7Bkf/uND
 8JGKyOl6Zaif/NA==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Gaurav Kashyap <quic_gaurkash@quicinc.com>

Extend the UFS core to allow calling the block layer's callback for
deriving the software secret from a wrapped key. This is needed as in
most cases the wrapped key support will be vendor-specific and the
implementation will live in the specific UFS driver.

Tested-by: Neil Armstrong <neil.armstrong@linaro.org>
Reviewed-by: Om Prakash Singh <quic_omprsing@quicinc.com>
Signed-off-by: Gaurav Kashyap <quic_gaurkash@quicinc.com>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/ufs/core/ufshcd-crypto.c | 15 +++++++++++++++
 include/ufs/ufshcd.h             |  3 +++
 2 files changed, 18 insertions(+)

diff --git a/drivers/ufs/core/ufshcd-crypto.c b/drivers/ufs/core/ufshcd-crypto.c
index 64389e876910..2530239d42af 100644
--- a/drivers/ufs/core/ufshcd-crypto.c
+++ b/drivers/ufs/core/ufshcd-crypto.c
@@ -113,6 +113,20 @@ static int ufshcd_crypto_keyslot_evict(struct blk_crypto_profile *profile,
 	return ufshcd_program_key(hba, NULL, &cfg, slot);
 }
 
+static int ufshcd_crypto_derive_sw_secret(struct blk_crypto_profile *profile,
+					  const u8 wkey[], size_t wkey_size,
+					  u8 sw_secret[BLK_CRYPTO_SW_SECRET_SIZE])
+{
+	struct ufs_hba *hba =
+		container_of(profile, struct ufs_hba, crypto_profile);
+
+	if (hba->vops && hba->vops->derive_sw_secret)
+		return hba->vops->derive_sw_secret(hba, wkey, wkey_size,
+						   sw_secret);
+
+	return -EOPNOTSUPP;
+}
+
 /*
  * Reprogram the keyslots if needed, and return true if CRYPTO_GENERAL_ENABLE
  * should be used in the host controller initialization sequence.
@@ -134,6 +148,7 @@ bool ufshcd_crypto_enable(struct ufs_hba *hba)
 static const struct blk_crypto_ll_ops ufshcd_crypto_ops = {
 	.keyslot_program	= ufshcd_crypto_keyslot_program,
 	.keyslot_evict		= ufshcd_crypto_keyslot_evict,
+	.derive_sw_secret	= ufshcd_crypto_derive_sw_secret,
 };
 
 static enum blk_crypto_mode_num
diff --git a/include/ufs/ufshcd.h b/include/ufs/ufshcd.h
index a2dad4f982c2..c11dd3baf53c 100644
--- a/include/ufs/ufshcd.h
+++ b/include/ufs/ufshcd.h
@@ -372,6 +372,9 @@ struct ufs_hba_variant_ops {
 	int	(*program_key)(struct ufs_hba *hba,
 			       const struct blk_crypto_key *bkey,
 			       const union ufs_crypto_cfg_entry *cfg, int slot);
+	int	(*derive_sw_secret)(struct ufs_hba *hba, const u8 wkey[],
+				    unsigned int wkey_size,
+				    u8 sw_secret[BLK_CRYPTO_SW_SECRET_SIZE]);
 	int	(*fill_crypto_prdt)(struct ufs_hba *hba,
 				    const struct bio_crypt_ctx *crypt_ctx,
 				    void *prdt, unsigned int num_segments);

-- 
2.43.0


