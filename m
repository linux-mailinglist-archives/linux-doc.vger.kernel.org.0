Return-Path: <linux-doc+bounces-40481-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DFFF4A5BC1B
	for <lists+linux-doc@lfdr.de>; Tue, 11 Mar 2025 10:26:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1A17D172BDA
	for <lists+linux-doc@lfdr.de>; Tue, 11 Mar 2025 09:26:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2DB8923237B;
	Tue, 11 Mar 2025 09:25:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="agggFf28"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3F2022FADE
	for <linux-doc@vger.kernel.org>; Tue, 11 Mar 2025 09:25:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741685150; cv=none; b=qKCX2mNHW+SJus1oY7PKtPBWtVty4sT7BB6HiT5baGqKJR8rrgMQcjVxFGjTyrgWfj2Xk0NioPR12qw6Evmu5B/70ZeqyVoEtWwYoRaR4D7Si4VkRR88U4WZIMbXWxOcDcp3Yee5XDT2bylbYutW/DezqkReSHbo2j1G5/GLmSY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741685150; c=relaxed/simple;
	bh=3byXgp4P/O/ND2QbeLx+RU+FGOviEZdPuLQWMQhYWyc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JZcViRHMAuQ0lFVGRAoiBfrafTzbVCI7zOHvSNeCWpNNvZ7Q7+mRYJT0fC2XFBJPuhiw3r30IWZ2DavBmisFHK49AcgbpRS3a3Wp9IrO/tNCxZp/rc7TCQ/e+gcG5RrgLnT0aSk5hluz56b3+HPFcaRcv0x8n+/xGtJq5Xd7eII=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=agggFf28; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-391342fc148so2425745f8f.2
        for <linux-doc@vger.kernel.org>; Tue, 11 Mar 2025 02:25:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1741685146; x=1742289946; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TlP1aFnu/CDXSr/k7ULiiydiHqpcTMvKfeRj+DO5m9I=;
        b=agggFf28mKJu2Iw1KoojJHNS5bPH9YnQ0ZKl9w73bi15l7gPrU87RxuG09PRalMfGA
         XByG4OLfpwSRxF0fu7Ra4RUEdG/3ndVDdkmNa/kTXD/NJlgKSUZiY5W7XzNdSXzcFeTO
         uiw8pA44eeQeDEtv8scjYbyuKhLyQEAGbIz9EbzGsTsu3bbxr6CyMTIde8OMREh23rSf
         S/tWvppRoG2y6DEr0cxURIGcmx/ZNFzXGOI05hNUlg3ca+XjUuyOdOjm/jLOCkNgg2kO
         dQ+y17b+mHZV9BQ+2prxu78cuH24MkCZEbjxaJ2aE5lJ8VhGwPe2011gKSeNkuCcecaf
         84kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741685146; x=1742289946;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TlP1aFnu/CDXSr/k7ULiiydiHqpcTMvKfeRj+DO5m9I=;
        b=A/ASBT4o2PDvdj8QCLlkGFj/2t7dUT9kznBM5/arfc4jN9kO6KCpurtFf3iErR562P
         o2sp7Qw2RD8nF3tk64mztFqzTxnIYEIw7d192cv5bAH5c7d2su7lXa31fHEVyN3voFDY
         i+CZUrMa62lLyzaOT/PLRer+6kti6dGV+8mCs/61OGrFAo5VyxUAWpUZQqoNSCtHJ7uW
         LphNuuCTOTQTtUW6RpcE7tD1laUG/+NYCXmBchbBfoVcfNDU3e9iAvq1e8xW49qlm2XL
         r/7+oYuYHcw9aof1qZq6yZEYaKjrvHC8JbCCvJOFk4TZtZgN77o5S98r1YG/NsdX8dYt
         nayg==
X-Forwarded-Encrypted: i=1; AJvYcCW/GwTYZ9z8QVGUirRX5UspPTnTL/i3z35f3E5qj+2nKCeNMxjbufdCldLCfUzxBY3DLCeREeZvrTQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw3OOwU+6Cf3BA5lBEfRVCMBn8Rg8GS8EhKxPAeVADRY7mP96+L
	qmNOLISx1ZbI5wYd3wExCmGdRwsPqYDK7QAX+oZuA6DPamIrAylcLw0gckAvX50=
X-Gm-Gg: ASbGncuoopxYur4dogxh60mwZEfqINVxVVfz1ox3aTgoGQThST04z20mq6EiSXemTlg
	vFkdybkn32SZBlbIaVcl5QuNwt4f4wyAYa2Y7SbvnnGgHVdziphrfi+bbjW7obcuqpc2JIoN/62
	Cu4n7q/UGJh4afJiMPzNqDHeFsjG1Lxx5g3KN9Gn+Hb3MRWKsydNs9IY33dXE5IkVTwEqqaHyT3
	3oMkViJ2vFhTQtRKPBqhe73msWRrd+2+djjk9oiYz0wtf4THTo69f963mXmqZjdFHkwfpbEPh9R
	CSu/zNJU5Dfk7E9CCRb8S4bN7fn7TIzcKi9a
X-Google-Smtp-Source: AGHT+IEFonuMUsv5t7RMkQ8iEA9Po7UEbOofnFEQRO86TnGyuTu9OQAPv+aswdukrUC/lL8XbNZzxQ==
X-Received: by 2002:a05:6000:2a5:b0:391:489a:ce12 with SMTP id ffacd0b85a97d-392646936demr3632369f8f.26.1741685145889;
        Tue, 11 Mar 2025 02:25:45 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:5946:3143:114d:3f3])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43cea8076fcsm107436465e9.15.2025.03.11.02.25.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Mar 2025 02:25:45 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 11 Mar 2025 10:25:33 +0100
Subject: [PATCH v7 2/8] dmaengine: qcom: bam_dma: extend the driver's
 device match data
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250311-qce-cmd-descr-v7-2-db613f5d9c9f@linaro.org>
References: <20250311-qce-cmd-descr-v7-0-db613f5d9c9f@linaro.org>
In-Reply-To: <20250311-qce-cmd-descr-v7-0-db613f5d9c9f@linaro.org>
To: Thara Gopinath <thara.gopinath@gmail.com>, 
 Herbert Xu <herbert@gondor.apana.org.au>, 
 "David S. Miller" <davem@davemloft.net>, Vinod Koul <vkoul@kernel.org>, 
 Jonathan Corbet <corbet@lwn.net>, Md Sadre Alam <quic_mdalam@quicinc.com>, 
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc: linux-crypto@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, dmaengine@vger.kernel.org, 
 linux-doc@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=3543;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=Pg4kQtSGs2f8BpuZiVEMtvVvzRRbqxcmk7ypHqWY96M=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBn0AGVl3C5lSeEdfpfP+zIBEzDJCcFCX2vmzasU
 gOKZib0fpaJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCZ9ABlQAKCRARpy6gFHHX
 chhBD/wIRjW/QOjQXff90g8HVICSDdXkKD5BRJH+wautyIX+duSZp1IFDylvKfYIMy5QHl3mTXA
 NTYdCzfKfzTze5I89ENDmJ+OsVC8tnYN7Qn+kPwfwYEZVFsMg9LOJHBAAOFV26FljVkgRCmImL6
 WHhu6e5mJFZrqmmZLZTLGRPhO2MkzHi/QzqnFmRkILhrjaOq0rNMRtoky8jyIA10i7c98vSbUNj
 05A0K55UIiNCd9o+jrsZeXG3zus+Fk+BYi0ai+cTWVBdTHYBAapa9MPPc5pCXT97mH3mJ52LzQl
 FVK+JbAYbRrs5A0OEiiTbkPtUNQIFUc7BUTOaPs6T1rde8MpuUi7b2+g2UhP0XmTIE1Pp0QKpIG
 cH7nucGIbu6fIjTG7TG9WO/+dmbd+SheIslA0pV17/0NFf7XF2FBYsMBxT/9yKMw9TOy0JCui8I
 Jn1jwBI3kY9AuUogPDDztpNoH5odNstKWFndGe2zgNQKEYKdyc7r7zt0ipC8e42XzsWZxU8bWXS
 a9mrdwihu61+tkiIuBmfVBSkeY3jRvnwTHtmcnT4tgiIsaLlZ4uX2buJg8EADfrpNq57XUPZ4Pd
 n/ybHmqcs/IEInA7ifOjGoq+bMe77cfKHL+wh2sNuSiEdcllYVbSTyx/HaAnO+JIYDCY6dPZV1p
 at4UvxJfshZDpkA==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

In preparation for supporting the pipe locking feature flag, extend the
amount of information we can carry in device match data: create a
separate structure and make the register information one of its fields.
This way, in subsequent patches, it will be just a matter of adding a
new field to the device data.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/dma/qcom/bam_dma.c | 28 ++++++++++++++++++++++------
 1 file changed, 22 insertions(+), 6 deletions(-)

diff --git a/drivers/dma/qcom/bam_dma.c b/drivers/dma/qcom/bam_dma.c
index 2cf060174795..8861245314b1 100644
--- a/drivers/dma/qcom/bam_dma.c
+++ b/drivers/dma/qcom/bam_dma.c
@@ -111,6 +111,10 @@ struct reg_offset_data {
 	unsigned int pipe_mult, evnt_mult, ee_mult;
 };
 
+struct bam_device_data {
+	const struct reg_offset_data *reg_info;
+};
+
 static const struct reg_offset_data bam_v1_3_reg_info[] = {
 	[BAM_CTRL]		= { 0x0F80, 0x00, 0x00, 0x00 },
 	[BAM_REVISION]		= { 0x0F84, 0x00, 0x00, 0x00 },
@@ -140,6 +144,10 @@ static const struct reg_offset_data bam_v1_3_reg_info[] = {
 	[BAM_P_FIFO_SIZES]	= { 0x1020, 0x00, 0x40, 0x00 },
 };
 
+static const struct bam_device_data bam_v1_3_data = {
+	.reg_info = bam_v1_3_reg_info,
+};
+
 static const struct reg_offset_data bam_v1_4_reg_info[] = {
 	[BAM_CTRL]		= { 0x0000, 0x00, 0x00, 0x00 },
 	[BAM_REVISION]		= { 0x0004, 0x00, 0x00, 0x00 },
@@ -169,6 +177,10 @@ static const struct reg_offset_data bam_v1_4_reg_info[] = {
 	[BAM_P_FIFO_SIZES]	= { 0x1820, 0x00, 0x1000, 0x00 },
 };
 
+static const struct bam_device_data bam_v1_4_data = {
+	.reg_info = bam_v1_4_reg_info,
+};
+
 static const struct reg_offset_data bam_v1_7_reg_info[] = {
 	[BAM_CTRL]		= { 0x00000, 0x00, 0x00, 0x00 },
 	[BAM_REVISION]		= { 0x01000, 0x00, 0x00, 0x00 },
@@ -198,6 +210,10 @@ static const struct reg_offset_data bam_v1_7_reg_info[] = {
 	[BAM_P_FIFO_SIZES]	= { 0x13820, 0x00, 0x1000, 0x00 },
 };
 
+static const struct bam_device_data bam_v1_7_data = {
+	.reg_info = bam_v1_7_reg_info,
+};
+
 /* BAM CTRL */
 #define BAM_SW_RST			BIT(0)
 #define BAM_EN				BIT(1)
@@ -391,7 +407,7 @@ struct bam_device {
 	bool powered_remotely;
 	u32 active_channels;
 
-	const struct reg_offset_data *layout;
+	const struct bam_device_data *dev_data;
 
 	struct clk *bamclk;
 	int irq;
@@ -409,7 +425,7 @@ struct bam_device {
 static inline void __iomem *bam_addr(struct bam_device *bdev, u32 pipe,
 		enum bam_reg reg)
 {
-	const struct reg_offset_data r = bdev->layout[reg];
+	const struct reg_offset_data r = bdev->dev_data->reg_info[reg];
 
 	return bdev->regs + r.base_offset +
 		r.pipe_mult * pipe +
@@ -1225,9 +1241,9 @@ static void bam_channel_init(struct bam_device *bdev, struct bam_chan *bchan,
 }
 
 static const struct of_device_id bam_of_match[] = {
-	{ .compatible = "qcom,bam-v1.3.0", .data = &bam_v1_3_reg_info },
-	{ .compatible = "qcom,bam-v1.4.0", .data = &bam_v1_4_reg_info },
-	{ .compatible = "qcom,bam-v1.7.0", .data = &bam_v1_7_reg_info },
+	{ .compatible = "qcom,bam-v1.3.0", .data = &bam_v1_3_data },
+	{ .compatible = "qcom,bam-v1.4.0", .data = &bam_v1_4_data },
+	{ .compatible = "qcom,bam-v1.7.0", .data = &bam_v1_7_data },
 	{}
 };
 
@@ -1251,7 +1267,7 @@ static int bam_dma_probe(struct platform_device *pdev)
 		return -ENODEV;
 	}
 
-	bdev->layout = match->data;
+	bdev->dev_data = match->data;
 
 	bdev->regs = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(bdev->regs))

-- 
2.45.2


