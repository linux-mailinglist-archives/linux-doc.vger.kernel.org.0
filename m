Return-Path: <linux-doc+bounces-31832-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D6AEA9E0172
	for <lists+linux-doc@lfdr.de>; Mon,  2 Dec 2024 13:06:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E76571660FE
	for <lists+linux-doc@lfdr.de>; Mon,  2 Dec 2024 12:05:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0BCEA205E2D;
	Mon,  2 Dec 2024 12:02:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="nPoi1ZV1"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87507204F88
	for <linux-doc@vger.kernel.org>; Mon,  2 Dec 2024 12:02:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733140977; cv=none; b=AOPVoX/YlURD0689C2EsreG//RXikg2wFNepmYZ/iOs6Yiyw0hKqOVBg5AI0BZq6cURFK1dAngaT2m8w71H7mvZ3PdWCZ7ogAS10OmMcgNcZjbJP3fcixkv07tQFObs2dxF81S+cRMNz8IJILiGYJ7P5dLzzCuHyGaoVN9VL6YA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733140977; c=relaxed/simple;
	bh=aRvxC21BhTxDXUKjx9ruTN4tMTQfge2gVFw2Pfe7Z+8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dOQ574zj5v3IoDZ1KJKvR3aXLJXSRjUb/vFnDqhC7RZJhVjWxI7pDPexHAwN1BL2a9RKrAsgAsb5tNF8pGC+s5pV2P8WnSb3k8tqaLmEHvsiti4VsQDFpoeYESh6elHVv8m6EH3xUVmnctIf33e/Ta34gdwDWnRuYdlM14BpqEA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=nPoi1ZV1; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-434a2033562so33445795e9.1
        for <linux-doc@vger.kernel.org>; Mon, 02 Dec 2024 04:02:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1733140972; x=1733745772; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=touQmIBQiXzWh1JEM9Gfn3mWpH6OCuAp3TCnoOv4GIQ=;
        b=nPoi1ZV1dk/wZVzi19MoUj6iWalim4RElGWnyw+wE7nHP+YwrXdqzbB419UZo2X1uE
         cxFX6pQ60yZQlew2Hh64lpEDN4untS9hkyVCDlXIeQoUb/+aTaKjhzKwGnoGDZxhfFUY
         XBY9vuu12KaAPH2+HCjqosqhpjQ9BjMZzpjaQF55MOuiT12Igi9RAHoUKHyL3YPWre6s
         xg6SDWx911B1Mk16550GgpOpZ0ogXjzOu+VwZE9pWSkGWhlIJ57XZzE8R1rkGxUqnVhZ
         BcpwrZPASTd8V4YE9rUVmL4CCVsMLkR++vUVMpJxoOqivAylC7XoOXCxG75mpNRyr567
         BKzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733140972; x=1733745772;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=touQmIBQiXzWh1JEM9Gfn3mWpH6OCuAp3TCnoOv4GIQ=;
        b=t1blcDFHySo92o39HxvLXBgP2f5DeSp1funUv6kfKeyYbfxdypqjHbqllvVui5dXe4
         e8lb092CoYeosMUXz2KQ6k0YT56YT0HS5+kHFquJpTHxr1SCRUptSoHeBwnfCUa+bzbr
         pc6b+sVkO0mLCZhbj1fMDu7GsnuSn5AYA//HGOkhYTUzeLKFUjGTXnbuW/nh99XZjEH5
         lHvXV9he2H5C4kfikqb6u3tORNXjP6fk+5Qcvx75gK67OWu4n+QAmIIq/mQ4vAlNAADH
         xZpTmJB3sTwW9oHVJRAea8wCoTvmgmbsJ2oTNkgAvcgz0poHSg/ZTsiVhbVu8wqLWB9r
         xzxQ==
X-Forwarded-Encrypted: i=1; AJvYcCXIZH2IRXjsiwZTU50rP2skpaoytc+xI1mAkPcjRjwvZ+yRG7k268crFSxCweRp7RHZrqsDD5Ll9fU=@vger.kernel.org
X-Gm-Message-State: AOJu0YynnZf5rUICtyrud6K+IRPSlomWsLL5X2VjslEzAx2fUm6+nljE
	2/fy2jOTpdkFT6+MXAF+eeX4fpB+YZa8m7fZFdgDna+5BPPzTJKo3EdiQcFN9sk=
X-Gm-Gg: ASbGncvOjw4uV9iYu0CXpuqtmzgWYT6sUtOZItg3e3hbhZA+u3OIrTf64XGhFmuhZck
	EfBQIhDmbkn2k5kl8z1C4xUsUx8P5KQhI3AYhEy/JbH4Sc8if4dcfnIwzTOCO9Mj7TZQR50h0xh
	KieWlsaEsDJZsIlx4afQTf+uMfuSL6FaDzet60R406m8EUYM6qec446XTMRtb5AXiQ3ip8HV4P/
	mr+iCmOcdHEG5pswzSp8i1OtjIThCJ0/OlO9RAN
X-Google-Smtp-Source: AGHT+IFVcG0WNXyZYjt32w+M6ShxZPiZDTgzJ1i2L8r2rKvxPJYT9RhXpy10UK6vs45kZUSgKb1ygg==
X-Received: by 2002:a05:600c:4686:b0:434:a962:2a8c with SMTP id 5b1f17b1804b1-434a9df6af9mr185930165e9.22.1733140972279;
        Mon, 02 Dec 2024 04:02:52 -0800 (PST)
Received: from [127.0.1.1] ([193.57.185.11])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-434b0d9bed7sm152396095e9.8.2024.12.02.04.02.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Dec 2024 04:02:51 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 02 Dec 2024 13:02:24 +0100
Subject: [PATCH RESEND v7 08/17] firmware: qcom: scm: add a call for
 checking wrapped key support
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241202-wrapped-keys-v7-8-67c3ca3f3282@linaro.org>
References: <20241202-wrapped-keys-v7-0-67c3ca3f3282@linaro.org>
In-Reply-To: <20241202-wrapped-keys-v7-0-67c3ca3f3282@linaro.org>
To: Jens Axboe <axboe@kernel.dk>, Jonathan Corbet <corbet@lwn.net>, 
 Alasdair Kergon <agk@redhat.com>, Mike Snitzer <snitzer@kernel.org>, 
 Mikulas Patocka <mpatocka@redhat.com>, 
 Adrian Hunter <adrian.hunter@intel.com>, 
 Asutosh Das <quic_asutoshd@quicinc.com>, 
 Ritesh Harjani <ritesh.list@gmail.com>, 
 Ulf Hansson <ulf.hansson@linaro.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Avri Altman <avri.altman@wdc.com>, Bart Van Assche <bvanassche@acm.org>, 
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>, 
 Gaurav Kashyap <quic_gaurkash@quicinc.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 "Martin K. Petersen" <martin.petersen@oracle.com>, 
 Eric Biggers <ebiggers@kernel.org>, "Theodore Y. Ts'o" <tytso@mit.edu>, 
 Jaegeuk Kim <jaegeuk@kernel.org>, Alexander Viro <viro@zeniv.linux.org.uk>, 
 Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc: linux-block@vger.kernel.org, linux-doc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, dm-devel@lists.linux.dev, 
 linux-mmc@vger.kernel.org, linux-scsi@vger.kernel.org, 
 linux-fscrypt@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1817;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=+R6JPSKxZAYNPKLIpsJZoN7OEYE2IK3CNpaiaGjz6AY=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBnTaHUvjd2zifuwXGVatR1JdebHWc/LZaLwgmus
 WGS0vMLua+JAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCZ02h1AAKCRARpy6gFHHX
 ctfPEACUk/7ZHHbhr8W2JfWwwmaiESzyTdR99Tou0BMLTIZyn9sJx0cMYsTClkr7tiSefKwqE4g
 A820hXjV7BEcEXwPxeJx5la8tQwsM7TuIP7TQakNzw+7HVZgviuxbez66ieom/ien9ksULr6dbC
 oGbUgUvT76nFiqf9lbMvgPgIjZkWqbu2FRmHZ4oodKwmYDerflRYUYY7IiqZUuEqVpyPNLRU4hG
 lH0PELE8mXUy6uqTukt1hUfiIrWPl8K6wY2RnWmeTT1I6wmAYXnQtk1YmxiBx2iTP0/eb2cf5HH
 RLJiBAd5aw2IlKRoCQpnSi0kWp2ltZbKyNWS0oP0eCc7/mFTJvPDjQviA09N1xcDW1lH3LjbCje
 6aatX/buSYuHDD2UId9EtMN7yfPC9n3YL9GvQsuVAN2rFyKaFt9xUTXgu0d2DJVjsiKeb1vd/In
 9rZ7c6bmHqNWRQjr22FT7YFz0xn1vxbKBObpWgkMdRxGC8qYnWuTO0UztFmHv5G3LUegTbFKLWT
 rXSJVszMxetXS5xKZTRRC/JW/+GHLVgl3QahGu9MPz6IuhuenA6ppDctI+TrMtmHD3NtzxM7vpa
 OHpol0GySgnRNelpG3cVBYIbrp1N2qHzbUnLkMz2VEhh/vlfzV1Xzy5d+bzPG6H9q8e6nhTBWVx
 cSYraZo571HQOpw==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Add a helper that allows users to check if wrapped key support is
available on the platform by checking if the SCM call allowing to
derive the software secret from a wrapped key is enabled.

Reviewed-by: Konrad Dybcio <konradybcio@kernel.org>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/firmware/qcom/qcom_scm.c       | 7 +++++++
 include/linux/firmware/qcom/qcom_scm.h | 1 +
 2 files changed, 8 insertions(+)

diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
index 14ba2c798f4d7..915b3fc388baa 100644
--- a/drivers/firmware/qcom/qcom_scm.c
+++ b/drivers/firmware/qcom/qcom_scm.c
@@ -1279,6 +1279,13 @@ int qcom_scm_ice_set_key(u32 index, const u8 *key, u32 key_size,
 }
 EXPORT_SYMBOL_GPL(qcom_scm_ice_set_key);
 
+bool qcom_scm_has_wrapped_key_support(void)
+{
+	return __qcom_scm_is_call_available(__scm->dev, QCOM_SCM_SVC_ES,
+					    QCOM_SCM_ES_DERIVE_SW_SECRET);
+}
+EXPORT_SYMBOL_GPL(qcom_scm_has_wrapped_key_support);
+
 /**
  * qcom_scm_derive_sw_secret() - Derive software secret from wrapped key
  * @wkey: the hardware wrapped key inaccessible to software
diff --git a/include/linux/firmware/qcom/qcom_scm.h b/include/linux/firmware/qcom/qcom_scm.h
index 9a585c1af959d..f4aed380ace5d 100644
--- a/include/linux/firmware/qcom/qcom_scm.h
+++ b/include/linux/firmware/qcom/qcom_scm.h
@@ -112,6 +112,7 @@ int qcom_scm_prepare_ice_key(const u8 *lt_key, size_t lt_key_size,
 			     u8 *eph_key, size_t eph_size);
 int qcom_scm_import_ice_key(const u8 *imp_key, size_t imp_size,
 			    u8 *lt_key, size_t lt_key_size);
+bool qcom_scm_has_wrapped_key_support(void);
 
 bool qcom_scm_hdcp_available(void);
 int qcom_scm_hdcp_req(struct qcom_scm_hdcp_req *req, u32 req_cnt, u32 *resp);

-- 
2.45.2


