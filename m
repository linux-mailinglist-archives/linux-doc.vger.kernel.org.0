Return-Path: <linux-doc+bounces-27284-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3717299AC06
	for <lists+linux-doc@lfdr.de>; Fri, 11 Oct 2024 20:59:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BABAC1F2609C
	for <lists+linux-doc@lfdr.de>; Fri, 11 Oct 2024 18:59:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 532FE1E7C34;
	Fri, 11 Oct 2024 18:54:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="M2VzqzTd"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D4671D0B8C
	for <linux-doc@vger.kernel.org>; Fri, 11 Oct 2024 18:54:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728672895; cv=none; b=Qw7Dz1MdhfRDKTqgqmOYMTrwkB+db3hbzB6NJEK1txNXZJy0dDZd4boYTQI574uyBJcqLWdHQJhTsL/yB7yZmdLq5QM/Nz+l61WM+oumGR66C2xGBdePF8pgYG9A2cXiSw8rEelDYvqmuoqrM4MR5c6THT52IQEZskHjJi4hzCM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728672895; c=relaxed/simple;
	bh=ldj2GPboWWV6klKA5zzXhrbBgDv7yjuDukUxSR5XLac=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Ft1iiK7hW2dDuZbLL3nFiKzEmQIqDDsKPiZeSwW+cPtcLa6/KF2yl4De7eJqy8bQ+M6EFEk0BpTXZboNthbLSuu3AssKz7UAeSX59TjZ731o6J7765+yfMW9q4598NoO3fNADUZOpHLl+KqBD0GqrGfOxLDUG9koqd5tSRf5+/M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=M2VzqzTd; arc=none smtp.client-ip=209.85.208.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-2fabfc06de3so26044951fa.1
        for <linux-doc@vger.kernel.org>; Fri, 11 Oct 2024 11:54:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1728672886; x=1729277686; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IQv7sxIwl848pSZRL5IFcSxv5uf9mZ9Yp6m9/sxxkj0=;
        b=M2VzqzTdsdVMo1arefVpg9IgUvodk6S7hvolPuXVQXZ61deDZOO8KGhVph2A6PNqrU
         WAkYvqWoM0fV1cHHZ4EMnsXheDXjFDFg0d14NMO6MnYjX+Xx2WthV+GxVoABvKbkoaaj
         RAdc080tr7TFMKQCdZJ8ht8RpMQAtNJwney+TTflBu+Y5RInyW7JWncpVf9nt+3vNDqT
         N22HtoQyVUbD3YxJj/B729fWBI6jx6v0l2s2WeXm3cPGwoy5m5/nTg1HtyWH0h5+tWuf
         XCO1/KBHiT1EUqsLOhOMmUmSew9Yng2YVXgFDnResl1VLwdLgkaSSinRfXuqI7fjKlPf
         a+Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728672886; x=1729277686;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IQv7sxIwl848pSZRL5IFcSxv5uf9mZ9Yp6m9/sxxkj0=;
        b=YkbOQ3y5lITQ52tDeUbcKznH9dMGQJ1zW0mPJITImOSVp6gML1sf84ivebOALlwQIY
         oFpYp0DJw1oG896+mqzJUmjOPgmUFnaswCGVQj5eq8ngE/Vpyqhxb7woj9E+QJ4cTGMb
         GKPinEH23hQPzV7sZfqEUh3VRI22m64aS/+9OethGQvvpyFnOlxpPn5TuQxMMRW2j3Ly
         UNFuxrDm7Zh4w1EX9FWNJI/b+AB4He6s3rHZEYiAVXxULIpwSiDHZ2ZnhbR+VOI/n23g
         lADpjzauqw6xeazBzOfspjFgqM8AA/+tGTRUfH2yDDhpMeBH6AhjFVtU37O3QsPHbvwe
         RADg==
X-Forwarded-Encrypted: i=1; AJvYcCV7zGj51HQ4Y2JRutpHDL2B2ohvGQeot9QSf0//4inX6cHEfL2wBEcp2kEjMsNmwPvq/djZ8jR2bmI=@vger.kernel.org
X-Gm-Message-State: AOJu0YyPFCBpaUwArQMDfGbrf8UH8qmsFN9m9ul+mEcBDwaLY65ZI6E7
	q0hlem5kyWIRu9uCEFDxn3/+94ufskU3h1BoNq1uyeTa6m/I5sqwPWkQUzndiZg=
X-Google-Smtp-Source: AGHT+IFcy03ZRQPqSeC9cuSBxo4PkWZJsOoMLCkEkzXlqxzk+nbj3iXHAOOO2iMhPWzZrAvTqRNEkQ==
X-Received: by 2002:a2e:5152:0:b0:2fb:3475:42e2 with SMTP id 38308e7fff4ca-2fb347543e3mr16437861fa.24.1728672885435;
        Fri, 11 Oct 2024 11:54:45 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:68b8:bef:b7eb:538f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37d4b79fe7csm4559161f8f.70.2024.10.11.11.54.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Oct 2024 11:54:45 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Fri, 11 Oct 2024 20:54:11 +0200
Subject: [PATCH v7 12/17] ufs: core: add support for wrapped keys to UFS
 core
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241011-wrapped-keys-v7-12-e3f7a752059b@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2829;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=kSNAg4Cg7lt9kA8Y9QFGrqnE75GttRm2ZeCOs5zZLVY=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBnCXRgz3wpu0+BmPDjfUCGlQZykfD0g8J2gBSHw
 e4ovQlJ612JAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCZwl0YAAKCRARpy6gFHHX
 chbaEADYsgCUHfhaeIXNmnetIBjLR65WJIKNlWjqtGy1b23P35IBpeYFt5NbCJUqQwn8mvEuenD
 yFDO2Ihso7iqDPh9LwXeBj/tShzSpZYi5IZOo33vKuLiYflO3gdutzjawn7QjzTQuPQYeHlODzJ
 H5ejRZCjuzJsmLfDuPl2eldtgzORJe9ppVqw2gkqP5XApQxnWzFsNBVg67wg7L2fiuxBDlt/2OJ
 EZvsA9DGxgfKQ+Xhatcpfy3pZM0hUBXv7KIMcdC1SBjqC9T4cW8sou5ZYBEb+BJJxyUvpCwhttr
 DHD+T4sPMbqUHG9cEexHSm1VmpojWGFVouvfMlrmlgj5OdFYQEU+k/d2S+wYfgwQrsM9uRGx12n
 sG3IsyJpgSFNcConqxl/sb8WfPM6KJ/MfUxz+nn+mFxQrzN3m2yoxHjmkrtgSFlSNAJsciiIB19
 1/X6yevLw6GW+6nkyUQmqgkEDFuTPQdDdHbJc4l0HvYR81ABEzS6ynmzikb/O8DqwdfrFO1hrO/
 jLvTYI+DiaPqlswdRt3+GzO6cDw+NQjY+0nfUkJ4NQLaltWoQepSDL1xbeYzuAS6/9Pok1/mHsQ
 zH10aVHSDaxTwYoYint8S3Lv501kGiuEiKZPDoqPEoAg6KsPLH+dG7CCAurIhpf9AbkN4cA4k/7
 pRutaMpiIigVkyA==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Gaurav Kashyap <quic_gaurkash@quicinc.com>

Add a new UFS capability flag indicating that the controller supports HW
wrapped keys and use it to determine which mechanism to use in UFS core.

Tested-by: Neil Armstrong <neil.armstrong@linaro.org>
Signed-off-by: Gaurav Kashyap <quic_gaurkash@quicinc.com>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/ufs/core/ufshcd-crypto.c | 24 ++++++++++++++++--------
 include/ufs/ufshcd.h             |  5 +++++
 2 files changed, 21 insertions(+), 8 deletions(-)

diff --git a/drivers/ufs/core/ufshcd-crypto.c b/drivers/ufs/core/ufshcd-crypto.c
index 33083e0cad6e..64389e876910 100644
--- a/drivers/ufs/core/ufshcd-crypto.c
+++ b/drivers/ufs/core/ufshcd-crypto.c
@@ -81,13 +81,15 @@ static int ufshcd_crypto_keyslot_program(struct blk_crypto_profile *profile,
 	cfg.crypto_cap_idx = cap_idx;
 	cfg.config_enable = UFS_CRYPTO_CONFIGURATION_ENABLE;
 
-	if (ccap_array[cap_idx].algorithm_id == UFS_CRYPTO_ALG_AES_XTS) {
-		/* In XTS mode, the blk_crypto_key's size is already doubled */
-		memcpy(cfg.crypto_key, key->raw, key->size/2);
-		memcpy(cfg.crypto_key + UFS_CRYPTO_KEY_MAX_SIZE/2,
-		       key->raw + key->size/2, key->size/2);
-	} else {
-		memcpy(cfg.crypto_key, key->raw, key->size);
+	if (key->crypto_cfg.key_type != BLK_CRYPTO_KEY_TYPE_HW_WRAPPED) {
+		if (ccap_array[cap_idx].algorithm_id == UFS_CRYPTO_ALG_AES_XTS) {
+			/* In XTS mode, the blk_crypto_key's size is already doubled */
+			memcpy(cfg.crypto_key, key->raw, key->size / 2);
+			memcpy(cfg.crypto_key + UFS_CRYPTO_KEY_MAX_SIZE / 2,
+			       key->raw + key->size / 2, key->size / 2);
+		} else {
+			memcpy(cfg.crypto_key, key->raw, key->size);
+		}
 	}
 
 	err = ufshcd_program_key(hba, key, &cfg, slot);
@@ -196,7 +198,13 @@ int ufshcd_hba_init_crypto_capabilities(struct ufs_hba *hba)
 	hba->crypto_profile.ll_ops = ufshcd_crypto_ops;
 	/* UFS only supports 8 bytes for any DUN */
 	hba->crypto_profile.max_dun_bytes_supported = 8;
-	hba->crypto_profile.key_types_supported = BLK_CRYPTO_KEY_TYPE_STANDARD;
+	if (hba->caps & UFSHCD_CAP_WRAPPED_CRYPTO_KEYS)
+		hba->crypto_profile.key_types_supported =
+				BLK_CRYPTO_KEY_TYPE_HW_WRAPPED;
+	else
+		hba->crypto_profile.key_types_supported =
+				BLK_CRYPTO_KEY_TYPE_STANDARD;
+
 	hba->crypto_profile.dev = hba->dev;
 
 	/*
diff --git a/include/ufs/ufshcd.h b/include/ufs/ufshcd.h
index 331b1ed171da..19c36f4ca381 100644
--- a/include/ufs/ufshcd.h
+++ b/include/ufs/ufshcd.h
@@ -763,6 +763,11 @@ enum ufshcd_caps {
 	 * WriteBooster when scaling the clock down.
 	 */
 	UFSHCD_CAP_WB_WITH_CLK_SCALING			= 1 << 12,
+
+	/*
+	 * UFS controller supports HW wrapped keys when using inline encryption.
+	 */
+	UFSHCD_CAP_WRAPPED_CRYPTO_KEYS			= 1 << 13,
 };
 
 struct ufs_hba_variant_params {

-- 
2.43.0


