Return-Path: <linux-doc+bounces-40484-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 17DA2A5BC29
	for <lists+linux-doc@lfdr.de>; Tue, 11 Mar 2025 10:26:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9D38D1896557
	for <lists+linux-doc@lfdr.de>; Tue, 11 Mar 2025 09:26:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1C72D235371;
	Tue, 11 Mar 2025 09:25:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="kJNYxgSJ"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5F1922B8BC
	for <linux-doc@vger.kernel.org>; Tue, 11 Mar 2025 09:25:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741685153; cv=none; b=OLGnT44fjbO/F6l2xJ1qMZFx6cbt/sar4WThlIOGU2NzbHAvrd64mXHHUB+nc9Aoz5PgpWX9hZ0BeCovFI7KJYjOKl1iQwI1Criq//o+1I3EW8iaDRI2SnHwHSZlBd3BdRnGNv1gi8KVYoXrcGYx4ktNFLQ7LDeD2f19JB5if60=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741685153; c=relaxed/simple;
	bh=bCBTdiY9gpe+GjDTQ9nXaL32tLWbU4XYtUC4YeXNwR0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=UXXF1G/W4g6LfJXMICAE3JNlUqRFWdNi/8Agdd4rsJe/3ks+UssLnErpPMOHDtlnA+s2hcaO+bQXkzaWHs9bqTfXzFJLb57m108/HT80lgT7Rk+vAZVVbcVAI+dvig4XSmW5wXD/SNnw1IaFNgXv5TrlDN8OOs94LazHZxsGY3k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=kJNYxgSJ; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-43cfecdd8b2so11289455e9.2
        for <linux-doc@vger.kernel.org>; Tue, 11 Mar 2025 02:25:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1741685149; x=1742289949; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/9l+f13mJPHrOnkggdATcJ5QYvscLs3l7oAK0s7GLCc=;
        b=kJNYxgSJCmXsB06S0hbrnzForSwgtwjq4SvYw6NaUrT2GsJkQj+pMPLrTMT5ofxpzt
         nsOejdDa3eOPxYURJAHJXmHmv7tFLedk7EVQG5OYyjhlXvvyU2k0OkDrbqcEF/Dj6MLL
         /3R2i+JPjrsHComIOrN497hpEK2GFenHkvEf44A17jVUuHzyp7tDRSwywAz0FBprHHTO
         3ivdbFiXciNLMtA3ozJCzeBG65l8/egpxq5yN73zrACcZTYzf02Pkp8ejvNZ97DDGmBa
         1D1mpg3/mmyK+/aSdaT5wYM+GvdkagN9qilJpijQK8a+A3V4oZ3iBtiMa4/LApnagmi7
         eX2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741685149; x=1742289949;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/9l+f13mJPHrOnkggdATcJ5QYvscLs3l7oAK0s7GLCc=;
        b=pKRSWxKMXMbPWq9Pc2/rR9ik0Lep/8cCnUFyjkSWPYTY16RPJpsnOFcSNRZW3RbH2i
         yUD9Vo5RPIyLFkkbMPNt+1okWcZ7OjVXQo2UsZfwwJPlFtqWyGpaGVR5pL9ht+CRoDEL
         2/57MhYqz9xKgpAZKCH+t/65N9BL8x2i11peqsh5X6ket5rQSCijWeJrQ06lsebSn+9R
         eKZ/Ox/5dIhcSbf87E+p5YXalZdhO9LfUbyFoncKJ4Gq4pEdRUEsKU3LnX2ea5vzRHpc
         iU7c7CnxifUu6/hSzR7Q5m09/URa3X2w756hCgWQHKSW5MwU6VGI73fmqZ0Xy4fdkwaM
         7GlQ==
X-Forwarded-Encrypted: i=1; AJvYcCUatFF1WKcyNBuNAdIPtHpfVoEOKB/SN+xZPwg6KVxX7ts5SZ5x2GmtE8YtqQy37LTMxL9+FnCf9AU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw9SDfLEQPHpYLLvifPhC8yp7NrXrBJeQChUan6Pv1kmUnqiL6w
	lZj3aOWmy/HU8KWEg5Ajn83+06rlb9TOc9V04O1c93bCNRp5XEnY5MFRjqNIsfpaCCo+45+xTXi
	8
X-Gm-Gg: ASbGncvM0oMX/1F0SnCBQYPSItWIMy6InyAI9NJ7dTqMnEapCg7wlDhsnT8lC0V5ZJt
	9h8u8d5pNTMCQ1ssTpHkHhWMttPX8idwPvMw5ROm0DFRUQDVb4cOHq150/+HzHwF7JFVzqR5h31
	yGN97zUw9IaNCUKkiffrS3W+xPcADNrh20kYpCcF7m2nkIB/kjCCSPj5G0oEHpRJBqq5XgfSSPM
	hTK3MmBhbPTA10GLwhdtkim4DLcpFNKkr152gHC/Iuolynm70Ddha8iSqUOk/nAWUa/fobzirWe
	QuETrYRUHeSxPOaimyh9gWcUmuiFU6DZ0UT7
X-Google-Smtp-Source: AGHT+IGEfyAw8lpsLkp1GcaKZsAIlWvd32NXVDeLfcXx3xz+a2E6j4imBlL6Bk3O5pZpmhsKNDWD/A==
X-Received: by 2002:a05:600c:1547:b0:43c:fceb:91f with SMTP id 5b1f17b1804b1-43cfceb0aedmr71012795e9.11.1741685149316;
        Tue, 11 Mar 2025 02:25:49 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:5946:3143:114d:3f3])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43cea8076fcsm107436465e9.15.2025.03.11.02.25.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Mar 2025 02:25:48 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 11 Mar 2025 10:25:36 +0100
Subject: [PATCH v7 5/8] crypto: qce - Map crypto memory for DMA
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250311-qce-cmd-descr-v7-5-db613f5d9c9f@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3050;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=9sPBxi7WcEbGhZ0zJXrjtGJm1E4sIIJKZPL3u1QqT70=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBn0AGWE9pP2abtJs+cO7NhWomGNMzeg6/jFNn1m
 ety2TFhJuuJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCZ9ABlgAKCRARpy6gFHHX
 cpSSD/91fZUju4zUV/ZekXs1tZBoKMTQqJ+czHlnxT11MLiRsg/LV4MsJahOedMuSoql8s62r/W
 8yv/rhWQ2jJu4dFi+7yUsgOuzkovq3C3I4LBY5nOIHGrzndfMDLRKKj+MmcQtgb++A2ARlFYZQj
 OonHKfEbymseprlvt2ujCmqw1Z1erF7SUTJ5Qcve1IZwxDOUx+Jcjsdek+iZErQJp3N3MzyabIg
 rLOltvTYAaSAv3mEVFjvQzPXDdJwH/XItvbz/kWPwTxNEZ7IPYOCc1xkmBfHGYQAJwZaZRrNetr
 EerORctn8YIZ4Pu5/ReqMOpPLCafLqW8DNVShzhXQmsBr0NCQMQKLhqGoywMJZh53eoYXlyNQuG
 P4pRaPRQk8OXUg2UQ1j6DX40dO4CwcffVbHGKY2b/RpkHzmC71oKQ9GperypP6I2X8NJOGfLag6
 9Bh9KNtjmNKNR3NAKJu0VmW7JnFghbETHCCV75FEyaoJOkvhggnLqZMjqoh+4hK4fUypbac5h55
 hT8Oi6+Qz8mXQwQgKwpUjnnNJl6KKx6MGu+6FpKrmlE9bG+r7GeK+Mp7eKudruwF+IiKclRg7eT
 ACvkewx/fYjaU0HcoMsSivLwCXRXH+e0FDxMHzaT3XW2nYcLSBiOJ+62m0670IEyarKdEOAhV4b
 dSs3QNcfVaEhSwQ==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Md Sadre Alam <quic_mdalam@quicinc.com>

In preparation for supporting command descriptors, map the crypto memory
range for DMA.

Signed-off-by: Md Sadre Alam <quic_mdalam@quicinc.com>
[Bartosz: add kerneldocs, fix DMA mapping leak, rework commit message]
Co-developed-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/crypto/qce/core.c | 24 ++++++++++++++++++++++--
 drivers/crypto/qce/core.h |  4 ++++
 2 files changed, 26 insertions(+), 2 deletions(-)

diff --git a/drivers/crypto/qce/core.c b/drivers/crypto/qce/core.c
index e95e84486d9a..b21c4ecd2034 100644
--- a/drivers/crypto/qce/core.c
+++ b/drivers/crypto/qce/core.c
@@ -187,10 +187,19 @@ static int qce_check_version(struct qce_device *qce)
 	return 0;
 }
 
+static void qce_crypto_unmap_dma(void *data)
+{
+	struct qce_device *qce = data;
+
+	dma_unmap_resource(qce->dev, qce->base_dma, qce->dma_size,
+			   DMA_BIDIRECTIONAL, 0);
+}
+
 static int qce_crypto_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
 	struct qce_device *qce;
+	struct resource *res;
 	int ret;
 
 	qce = devm_kzalloc(dev, sizeof(*qce), GFP_KERNEL);
@@ -200,7 +209,7 @@ static int qce_crypto_probe(struct platform_device *pdev)
 	qce->dev = dev;
 	platform_set_drvdata(pdev, qce);
 
-	qce->base = devm_platform_ioremap_resource(pdev, 0);
+	qce->base = devm_platform_get_and_ioremap_resource(pdev, 0, &res);
 	if (IS_ERR(qce->base))
 		return PTR_ERR(qce->base);
 
@@ -246,7 +255,18 @@ static int qce_crypto_probe(struct platform_device *pdev)
 	qce->async_req_enqueue = qce_async_request_enqueue;
 	qce->async_req_done = qce_async_request_done;
 
-	return devm_qce_register_algs(qce);
+	ret = devm_qce_register_algs(qce);
+	if (ret)
+		return ret;
+
+	qce->dma_size = resource_size(res);
+	qce->base_dma = dma_map_resource(dev, res->start, qce->dma_size,
+					 DMA_BIDIRECTIONAL, 0);
+	ret = dma_mapping_error(dev, qce->base_dma);
+	if (ret)
+		return ret;
+
+	return devm_add_action_or_reset(qce->dev, qce_crypto_unmap_dma, qce);
 }
 
 static const struct of_device_id qce_crypto_of_match[] = {
diff --git a/drivers/crypto/qce/core.h b/drivers/crypto/qce/core.h
index eb6fa7a8b64a..b86caf8b926d 100644
--- a/drivers/crypto/qce/core.h
+++ b/drivers/crypto/qce/core.h
@@ -26,6 +26,8 @@
  * @dma: pointer to dma data
  * @burst_size: the crypto burst size
  * @pipe_pair_id: which pipe pair id the device using
+ * @base_dma: base DMA address
+ * @dma_size: size of memory mapped for DMA
  * @async_req_enqueue: invoked by every algorithm to enqueue a request
  * @async_req_done: invoked by every algorithm to finish its request
  */
@@ -42,6 +44,8 @@ struct qce_device {
 	struct qce_dma_data dma;
 	int burst_size;
 	unsigned int pipe_pair_id;
+	dma_addr_t base_dma;
+	size_t dma_size;
 	int (*async_req_enqueue)(struct qce_device *qce,
 				 struct crypto_async_request *req);
 	void (*async_req_done)(struct qce_device *qce, int ret);

-- 
2.45.2


