Return-Path: <linux-doc+bounces-24712-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 766F196FAFE
	for <lists+linux-doc@lfdr.de>; Fri,  6 Sep 2024 20:12:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9476A1C24DC5
	for <lists+linux-doc@lfdr.de>; Fri,  6 Sep 2024 18:12:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A3A28205E01;
	Fri,  6 Sep 2024 18:07:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="F9I4hcTN"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCE001E976E
	for <linux-doc@vger.kernel.org>; Fri,  6 Sep 2024 18:07:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725646078; cv=none; b=TWdS/JmHA5p3iqWhqU3r2wbCgMP7ijMVqgpDg3pIG/Z5fndGkK/m4B3srDujlGx0j6RnK0z+L2T9We21sX/eFBLt1D5hOgaY96G4ONzfn0CG2pthVDah2tmSHGKh6sPn+Il1B0dm3UxNPMCEk1s3TfGhY2R0LfgbT1P0NCrOVnE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725646078; c=relaxed/simple;
	bh=XmKi3om+QIlz1n1d0BE5fPvlcfOFLvqiCAL3MzSWSf8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=siIAbzINMkMLW/GVqplkd7I3TYLtDZMNCkKBWFCbXT67vwAok58fNq2cZwGCqKjwTR/qvgJ77DIwMKdSyQwAXJbDIg8Y7VtkA30lRSfMmyzP3DqdIEFN6l8//ewpEXko3C2uDJQBW6419spbvKKDHnjAGD8xUqt1WNjDL5pvtko=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=F9I4hcTN; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-42ca4e0299eso6021435e9.2
        for <linux-doc@vger.kernel.org>; Fri, 06 Sep 2024 11:07:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1725646071; x=1726250871; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TJzQD2LEed34myQpxxJLF222iqCvf6GrK4TLRL1oSug=;
        b=F9I4hcTNabVb3vrwYAcdwVK3UXQUpuTw2eEBWRShyX4bWrIVM+qX2bYdBqKBCVCuL6
         W2s5+MgMzcPFDuIaEK46bvqMcZXk4WEknEipmSZ2es63dnH70nQu1Lwqo+nIq5TljH0g
         Jeicr4efqo55PFGvX5q9wN7eN7TVhiR8pSgWW7CwEgoT0go45Qe6l6lekcnwwhSef/qX
         5nwqrjrHxW989nxYdad6eg3vSEaHn7sixQMx3qe6qkey7sAGcfMPEWVo9UB5qieeJa48
         5SsQ67KvTHbTrdMunansNYYtnscalRH1/iOXeKdSCGV93DcDvcICFFcAdPOyteQ5FxlW
         gEgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725646071; x=1726250871;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TJzQD2LEed34myQpxxJLF222iqCvf6GrK4TLRL1oSug=;
        b=EiF7s1XHIyMP3Mh+Ywpu6TZ6M7cfP/ReDAbkO3/V77z/fzEED6f/FMN4MAISdyT8r9
         z/u1ANSzPYKZru5gbF6mg+y2fRXv2z1ZD3K2kkeTdvPF4+OB8rK2VEm695LGCiaA/9ID
         jaUmG9fv8G3zZGxWXlPs7myWoAPm5R+Gx4danuB8uG5AQxyXl77FkpYco4nE9zAlKc/3
         YmyvfLK9YBllNluQz6no2/CogajYumVU+NZD7b+x0RhRBDjQHl42uXvYmNMm952i+R5s
         pas/if7QmoMQK5qBDiu+6og1IOaWloJ8av9Jbgazo66NxJj59ZWttdguJcSuss414KYf
         ju3w==
X-Forwarded-Encrypted: i=1; AJvYcCWCrBRgkZRrTdOUWD6bKP568rXX/yMaLI42P8zrhXYg9kA5xK/nKfpoZLDQOQtm4oGhmU+Azzmu1GA=@vger.kernel.org
X-Gm-Message-State: AOJu0YzYHEBOsom7Pcn2vxOcvk+tZrfChh3qsvdoZk7HvEYHzbU/nrOq
	pYhuksmzBr7jCMxVIF6oPxUggdIS342LEi3d7J90MBFiq1id19LXaxQqEM8me/Q=
X-Google-Smtp-Source: AGHT+IEyoMWYkwPX8KGRJ2s0GL9eSAS2Y+HjmZlVPBL9Brpu8bEP2tLNAZiNmlP+UkXcD//ENdL1dA==
X-Received: by 2002:a05:600c:1c16:b0:42b:afe3:e9f4 with SMTP id 5b1f17b1804b1-42cad746525mr709545e9.3.1725646071221;
        Fri, 06 Sep 2024 11:07:51 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:b9fc:a1e7:588c:1e37])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42cac8543dbsm5880485e9.42.2024.09.06.11.07.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Sep 2024 11:07:50 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Fri, 06 Sep 2024 20:07:19 +0200
Subject: [PATCH v6 16/17] ufs: host: add a callback for deriving software
 secrets and use it
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240906-wrapped-keys-v6-16-d59e61bc0cb4@linaro.org>
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
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2513;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=idjNjWapj1bs0Ldu/9tHu9tyNyBC4AsG5ouabbctqz0=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBm20Ta2lebndwd66b+zzmajpsSSPL4dPKl7vpCQ
 fPPf1aj/RCJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCZttE2gAKCRARpy6gFHHX
 csEyD/9SVw5arcoptqwXkk4O3NKDnxuWvg9guPiq9pNQnUpUKOXHvzWg+kef98Vi3nGnKHIVql1
 PySghu5/7BFDuGZxc6AaLEAZLyR4VXn9vIu/oodP9NThamajDDM3dcPKDGU18XrpVVNgdIBWpwJ
 95E/G/00SezC3y7PtKO+JLO2RIAgvH7abFtQfIBVftiniLr30GhPbIjUCSi+7VFVCZaGQAdCJM3
 4xsVf3WkMATBgMjSCYaSrB4rYNGbgbqbsy2XXmRehFumf4w1/DQGKAnuhNO9uODJen+ld3fLqjQ
 X7Bl5i1ojWc2/HgpPzwVroJJd0A8dUaInmUmVR26m0eLTILn73BPZJ3LE+4sn0YHascCQqHnyiG
 cqmjPHEFn54JnVnDfCBMS5liIRe8MFwkXbIciqoOiWAQsPtphpyXcrP1+qaQzkjnDq8aHyEtuiK
 MFRKNKF/MJytb1mGQW/vjKoAzuKvbyaHwzD/K2XUGuGJPRraYhKfb1hXyVJhb91Y3ueHPHTehy5
 3hyFQlzT/uwITQ0skkksVB+/6ftCzZ4nsHglM8Agvrinhvv+8gTqBnjuZbGAFDBGK5UFyIlyoNZ
 2SwUodqRrJXeW4BrTRIXAXM1xLD8mnHqr+P9TGVMfVazPwaEX5p46juHIT8HUpT35xlvH/RBvWB
 MAQ3AzPLJftzBdg==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Gaurav Kashyap <quic_gaurkash@quicinc.com>

Add a new UFS core callback for deriving software secrets from hardware
wrapped keys and implement it in QCom UFS.

Tested-by: Neil Armstrong <neil.armstrong@linaro.org>
Signed-off-by: Gaurav Kashyap <quic_gaurkash@quicinc.com>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/ufs/host/ufs-qcom.c | 15 +++++++++++++++
 include/ufs/ufshcd.h        |  1 +
 2 files changed, 16 insertions(+)

diff --git a/drivers/ufs/host/ufs-qcom.c b/drivers/ufs/host/ufs-qcom.c
index 366fd62a951f..77fb5e66e4be 100644
--- a/drivers/ufs/host/ufs-qcom.c
+++ b/drivers/ufs/host/ufs-qcom.c
@@ -182,9 +182,23 @@ static int ufs_qcom_ice_program_key(struct ufs_hba *hba,
 		return qcom_ice_evict_key(host->ice, slot);
 }
 
+/*
+ * Derive a software secret from a hardware wrapped key. The key is unwrapped in
+ * hardware from trustzone and a software key/secret is then derived from it.
+ */
+static int ufs_qcom_ice_derive_sw_secret(struct ufs_hba *hba, const u8 wkey[],
+					 unsigned int wkey_size,
+					 u8 sw_secret[BLK_CRYPTO_SW_SECRET_SIZE])
+{
+	struct ufs_qcom_host *host = ufshcd_get_variant(hba);
+
+	return qcom_ice_derive_sw_secret(host->ice, wkey, wkey_size, sw_secret);
+}
+
 #else
 
 #define ufs_qcom_ice_program_key NULL
+#define ufs_qcom_ice_derive_sw_secret NULL
 
 static inline void ufs_qcom_ice_enable(struct ufs_qcom_host *host)
 {
@@ -1815,6 +1829,7 @@ static const struct ufs_hba_variant_ops ufs_hba_qcom_vops = {
 	.device_reset		= ufs_qcom_device_reset,
 	.config_scaling_param = ufs_qcom_config_scaling_param,
 	.program_key		= ufs_qcom_ice_program_key,
+	.derive_sw_secret	= ufs_qcom_ice_derive_sw_secret,
 	.reinit_notify		= ufs_qcom_reinit_notify,
 	.mcq_config_resource	= ufs_qcom_mcq_config_resource,
 	.get_hba_mac		= ufs_qcom_get_hba_mac,
diff --git a/include/ufs/ufshcd.h b/include/ufs/ufshcd.h
index c11dd3baf53c..b8b1763df022 100644
--- a/include/ufs/ufshcd.h
+++ b/include/ufs/ufshcd.h
@@ -323,6 +323,7 @@ struct ufs_pwr_mode_info {
  * @device_reset: called to issue a reset pulse on the UFS device
  * @config_scaling_param: called to configure clock scaling parameters
  * @program_key: program or evict an inline encryption key
+ * @derive_sw_secret: derive sw secret from a wrapped key
  * @fill_crypto_prdt: initialize crypto-related fields in the PRDT
  * @event_notify: called to notify important events
  * @reinit_notify: called to notify reinit of UFSHCD during max gear switch

-- 
2.43.0


