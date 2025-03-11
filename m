Return-Path: <linux-doc+bounces-40479-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B062A5BC11
	for <lists+linux-doc@lfdr.de>; Tue, 11 Mar 2025 10:26:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BFCD7189473A
	for <lists+linux-doc@lfdr.de>; Tue, 11 Mar 2025 09:26:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2F55F22FDE2;
	Tue, 11 Mar 2025 09:25:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="bvV5/UMC"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5FB022DFBB
	for <linux-doc@vger.kernel.org>; Tue, 11 Mar 2025 09:25:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741685148; cv=none; b=RjdRX8jgwCvp67ILfcgEe7CCqYN/qiWTdfIx1C+uQW/YpcDsUIJDI+swAMuf4h8mimKOUFfyttH0whsoli0KSt/jdwLOXu9ss6Y2ciIZ4Dxx+8eWo7j+hvSUtg27Cmly1BMQ6AQ801TwgzSqUTzS3icFqGH7YRWr1I/dIXjacKM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741685148; c=relaxed/simple;
	bh=xAPy9smZX4JaMXG1dMP582ttvGK0EU+rWOX5rQXJgqs=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=kY6Ojhd4dibYOhMvtc+8/KJTIWJx0M8E2qyFoVIN2YyjMWwcAjEhVXbL05Mz7JjGNNnExVf8ckIMkqGxcQtxGgmnFSkSY0ZASzu0XLUJwMbmlEJJWtyDGjaBR/Yr2cUqRdsfXrDtMdN3UsurEopjm7zcMvKEhf379RG+jq1Gbg0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=bvV5/UMC; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-43cebe06e9eso15902525e9.3
        for <linux-doc@vger.kernel.org>; Tue, 11 Mar 2025 02:25:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1741685144; x=1742289944; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=F02KdgK8Dqt1eRGeszRUwwomOPCYNfwiCGJDNiVdo3g=;
        b=bvV5/UMCVu8R7ZN0OkTQvcSsVHotqmBnotXaLIUvYcTISCtXskjp+6arz2TPiYDZiB
         mBpAYfp59Izc10qFQo8AMZGZduSWLaXRYF8oAZC2yxkgKsawjVqWL35QbMLPhxc7o8Yu
         4V+YkKsui6WmVrHeqTDkL0OjTCAAQGzfmB5gxbMhUOPnNHtN7dOJtVPFR/QIKbwKxvp3
         zw6Vl3sBGg7Y1gc43uMKOETrl7pHHw83OvNJcmVK89KfO4q7t2gedoxU2ARrpL2UVlyl
         /dPZOhIBLxd8qB8VMcbnrTfd+CkpW4EBkLC+bD5C3bsC1Cdo9dpBpZUK0JSHZozVuRLC
         7rhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741685144; x=1742289944;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=F02KdgK8Dqt1eRGeszRUwwomOPCYNfwiCGJDNiVdo3g=;
        b=KiC/vR2IhFpXaYlJAXZITfLcx0I3qeHRKrjJDAGonf6EmjhErvGU6qVpVfnOa63UAZ
         5y3XamPKcT1RUQsSICrXhgT4ukURxNMJc+2A/+MN/C6HJgveKK4kqvHplmkkTgwlBwvL
         kXDh6N0HFNslN4gkraFIrXj7ew3rvvjtczB6YCquShUqeVogz67DbVRfP3/OEP+6lkTX
         u/r7MxgvbHMBCzoc64w115/lzEI3j7HQvzLmtIw2Fv9w/3t/SfrrZNbDNct3VE+UIKyQ
         +xLVnouiDWvbQNEP1wJsKMr/JbkTb1mCghtNZoZJIGdW+OwKvcnR5EZKELWk2Mq9fhl2
         Cs4w==
X-Forwarded-Encrypted: i=1; AJvYcCWQ62806s3XBo3iEMMniq1ixwOPLn96ejfXyiJTrXjyULieXjIYbEegfKjSlDoDrheT6O6vc0dQLQw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz/ZXG8fq9pSSeCNH/tv5YX2XRFjnDKHUPJjPip5VGssmVDqeEV
	zxY+w6zSLYmYPzeo9E6BaeG2C3kyjERzBW9r3+odIB35aRROH9Ie7iTPTyLGIYA=
X-Gm-Gg: ASbGnctpGeveiK4ghXs3GNAA4OJtRnk6FLhiC9PSgvrpdusMqrxLWNqhjKa+LiOrx5G
	VTqE6PyDAPrPPnsdXajgwR+CdLdBc4jQfVCWDeE4qcySLVGKaW0HTLDxMIJDUVppEA8bt8Qi4sj
	zXYMjuWcX9XLL+BJcn+GcHcYcGdmAQJeUUCHo1Nhg4QkOBj8YJLom+bWdUTx/DhfCYlLFCTB6fy
	CQnyRhGXfFbiZI2IDj+M1QY1MEwZ7bhvBdHu+fLJE0sQ0I4rfRBUodzBUwIotDO8CPkm6HW2IIK
	EMcv8Vpr+inDcM3w3L5+JIVd0YkP5vgAgID/sUG+AbjjxYI=
X-Google-Smtp-Source: AGHT+IGAWYHIaCFH9ClXxQNHBP9XrmKZe3gXXpNpnHZWWvWnxuXRhyDexSPkysgkrSrvUO3dWswMKQ==
X-Received: by 2002:a05:600c:46cf:b0:43c:e8ca:5140 with SMTP id 5b1f17b1804b1-43ce8ca528dmr85545245e9.23.1741685143755;
        Tue, 11 Mar 2025 02:25:43 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:5946:3143:114d:3f3])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43cea8076fcsm107436465e9.15.2025.03.11.02.25.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Mar 2025 02:25:43 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [PATCH v7 0/8] dmaengine: qcom: bam_dma: add command descriptor
 support
Date: Tue, 11 Mar 2025 10:25:31 +0100
Message-Id: <20250311-qce-cmd-descr-v7-0-db613f5d9c9f@linaro.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAIsB0GcC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyzHUUlJIzE
 vPSU3UzU4B8JSMDI1MDYwMz3cLkVN3k3BTdlNTi5CJdkyRLM7OUZCPLxGRDJaCegqLUtMwKsHn
 RsbW1AFyOl+5fAAAA
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=9396;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=xAPy9smZX4JaMXG1dMP582ttvGK0EU+rWOX5rQXJgqs=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBn0AGUxzoSBo0d67Av21AXNr2Z2OBWNBlhKw7ia
 dYG7+wnC36JAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCZ9ABlAAKCRARpy6gFHHX
 csojEACCI2OpQfioSeW4z3WHSBn5v872VinMporNT2d6zGtqXQokelqf0oswNnHINR7wVSOIT2G
 zVoUXn67nmPNi3mwmIcvp1K2XNFRpLuXwpwB/OveLHogeV5DpgB98X6/46wdDRbNKW3F2NUaBCc
 gAn/sDE4IjKb44dBgstpixTrtMbf2Z/apW/YvEcwjg9FiYbVL1PcwgOL+7n/Gm/bR2ezkIRuIVQ
 DtGMH37Hrtsf9J7o8GbyHoQAzHnIpLxjg7/6Nin6OhvYpnMv9nLpHIuApyh2ofpcHPbhLgsoBkV
 IFNTQozD818sMEvxQ7oE/dE1rCWIhkB3dgXku3SfgS9ciA/tiQNtU3JiDxxdsbuAE28/Cu22D4H
 ZNOTnMbv0bpE1p31cbR1FRRxrtTw1oJfxXa8uORx5Zo1PXE41yoSFBV+d+TS+0sIy61Khe5bLku
 Z+aaRo7zCzsuw6ozHWjIf9myi3xJZo/iLrhFeCsfc7IoVXjQ/tbc2S4qszeCvR3mIVntBGFP19S
 cW/qI7czJk55MMzo9ZrR4qxr/semknZuQwniqvgbUSNLCRfN+bIOWxBiCI0Tg6h37+egmHIc7Zs
 DHY5KDTM0TMkTNtwZ+Wy16gNDSf6ht4OoQ+nSw9pKrX3fovMaAppBkNpqI2fyx+3+8Cb7WsvWTZ
 g5eIIpy31JphwgA==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

Note: I took over the work on this feature from Sadre.

This series is based on top of v6.14-rc6 and the following series from
Stephan Gerhold:
  https://lore.kernel.org/all/20250212-bam-dma-fixes-v1-0-f560889e65d8@linaro.org/

There's also an outstanding problem with the iommus property of the
crypto and cryptobam platforms (identified at least on sm8650 and
sc7280). This can be worked around by removing them like:

diff --git a/arch/arm64/boot/dts/qcom/sc7280.dtsi b/arch/arm64/boot/dts/qcom/sc7280.dtsi
index 0f2caf36910b..2dd378d4c299 100644
--- a/arch/arm64/boot/dts/qcom/sc7280.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7280.dtsi
@@ -2408,8 +2408,6 @@ cryptobam: dma-controller@1dc4000 {
                        reg = <0x0 0x01dc4000 0x0 0x28000>;
                        interrupts = <GIC_SPI 272 IRQ_TYPE_LEVEL_HIGH>;
                        #dma-cells = <1>;
-                       iommus = <&apps_smmu 0x4e4 0x0011>,
-                                <&apps_smmu 0x4e6 0x0011>;
                        qcom,ee = <0>;
                        qcom,controlled-remotely;
                        num-channels = <16>;
@@ -2421,8 +2419,6 @@ crypto: crypto@1dfa000 {
                        reg = <0x0 0x01dfa000 0x0 0x6000>;
                        dmas = <&cryptobam 4>, <&cryptobam 5>;
                        dma-names = "rx", "tx";
-                       iommus = <&apps_smmu 0x4e4 0x0011>,
-                                <&apps_smmu 0x4e4 0x0011>;
                        interconnects = <&aggre2_noc MASTER_CRYPTO 0 &mc_virt SLAVE_EBI1 0>;
                        interconnect-names = "memory";
                };

But a proper fix is being worked on. I'm sending this series out for
review anyway but it's v6.16 material.

Currently the QCE crypto driver accesses the crypto engine registers
directly via CPU. Trust Zone may perform crypto operations simultaneously
resulting in a race condition.

To avoid this behavior we need to use BAM HW LOCK/UNLOCK feature on BAM
pipes, This is achieved by sending a command descriptor performing
a dummy write with a relevant flag set.

This feature was tested with tcrypt.ko and "libkcapi" with all the AES
algorithms supported by QCE crypto engine. Tested on IPQ9574,
qcm6490.LE, sc7280 and sm8650.

Testing:

  insmod tcrypt.ko mode=101
  insmod tcrypt.ko mode=102
  insmod tcrypt.ko mode=155
  insmod tcrypt.ko mode=180
  insmod tcrypt.ko mode=181
  insmod tcrypt.ko mode=182
  insmod tcrypt.ko mode=185
  insmod tcrypt.ko mode=186
  insmod tcrypt.ko mode=212
  insmod tcrypt.ko mode=216
  insmod tcrypt.ko mode=403
  insmod tcrypt.ko mode=404
  insmod tcrypt.ko mode=500
  insmod tcrypt.ko mode=501
  insmod tcrypt.ko mode=502
  insmod tcrypt.ko mode=600
  insmod tcrypt.ko mode=601
  insmod tcrypt.ko mode=602

  Encryption command line:
 ./kcapi -x 1 -e -c "cbc(aes)" -k
 8d7dd9b0170ce0b5f2f8e1aa768e01e91da8bfc67fd486d081b28254c99eb423 -i
 7fbc02ebf5b93322329df9bfccb635af -p 48981da18e4bb9ef7e2e3162d16b1910
 * 8b19050f66582cb7f7e4b6c873819b71
 *
 Decryption command line:
 * $ ./kcapi -x 1 -c "cbc(aes)" -k
 3023b2418ea59a841757dcf07881b3a8def1c97b659a4dad -i
 95aa5b68130be6fcf5cabe7d9f898a41 -q c313c6b50145b69a77b33404cb422598
 * 836de0065f9d6f6a3dd2c53cd17e33a

 * $ ./kcapi -x 3 -c sha256 -p 38f86d
 * cc42f645c5aa76ac3154b023359b665375fc3ae42f025fe961fb0f65205ad70e
 * $ ./kcapi -x 3 -c sha256 -p bbb300ac5eda9d
 * 61f7b48577a613fbdfe0d6d90b49985e07a42c99e7a439b6efb76d5ec71b3d30

 ./kcapi -x 12 -c "hmac(sha256)" -k
 0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b -i
 000102030405060708090a0b0c -p f0f1f2f3f4f5f6f7f8f9 -b 42
 *
 3cb25f25faacd57a90434f64d0362f2a2d2d0a90cf1a5a4c5db02d56ecc4c5bf3400720
 8d5b887185865

 Paraller test with two different EE's (Execution Environment)

 EE1 (Trust Zone)                          EE2 (HLOS)

 There is a TZ application which    "libkcapi" or "tcrypt.ko" will run in
 will do continuous enc/dec with     continuous loop to do enc/dec with
 different AES algorithm supported   different algorithm supported QCE
 by QCE crypto engine.               crypto engine.

1) dummy write with LOCK bit set    1) dummy write with LOCK bit set                       
2) bam will lock all other pipes    2) bam will lock all other pipes which
   which not belongs to current        not belongs to current EE's, i.e tz
   EE's, i.e HLOS pipe and keep        pipe and keep handling current
   handling current pipe only.         pipe only.
                                    3) hlos prepare data descriptor and               
3) tz prepare data descriptor          submit to CE5
   and submit to CE5                4) dummy write with UNLOCK bit set
4) dummy write with UNLOCK bit      5) bam will release all the locked
   set                                 pipes
5) bam will release all the locked
   pipes                   

Upon encountering a descriptor with Lock bit set, the BAM will lock all
other pipes not related to the current pipe group, and keep handling the
current pipe only until it sees the Un-Lock set (then it will release all
locked pipes). The actual locking is done on the new descriptor fetching
for publishing, i.e. locked pipe will not fetch new descriptors even if
it got event/events adding more descriptors for this pipe.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
Changes in v7:
- remove unused code: writing to multiple registers was not used in v6,
  neither were the functions for reading registers over BAM DMA-
- remove 
- don't read the SW_VERSION register needlessly in the BAM driver,
  instead: encode the information on whether the IP supports BAM locking
  in device match data
- shrink code where possible with logic modifications (for instance:
  change the implementation of qce_write() instead of replacing it
  everywhere with a new symbol)
- remove duplicated error messages
- rework commit messages
- a lot of shuffling code around for easier review and a more
  streamlined series
- Link to v6: https://lore.kernel.org/all/20250115103004.3350561-1-quic_mdalam@quicinc.com/

Changes in v6:
- change "BAM" to "DMA"
- Ensured this series is compilable with the current Linux-next tip of
  the tree (TOT).

Changes in v5:
- Added DMA_PREP_LOCK and DMA_PREP_UNLOCK flag support in separate patch
- Removed DMA_PREP_LOCK & DMA_PREP_UNLOCK flag
- Added FIELD_GET and GENMASK macro to extract major and minor version

Changes in v4:
- Added feature description and test hardware
  with test command
- Fixed patch version numbering
- Dropped dt-binding patch
- Dropped device tree changes
- Added BAM_SW_VERSION register read
- Handled the error path for the api dma_map_resource()
  in probe
- updated the commit messages for batter redability
- Squash the change where qce_bam_acquire_lock() and
  qce_bam_release_lock() api got introduce to the change where
  the lock/unlock flag get introced
- changed cover letter subject heading to
  "dmaengine: qcom: bam_dma: add cmd descriptor support"
- Added the very initial post for BAM lock/unlock patch link
  as v1 to track this feature

Changes in v3:
- https://lore.kernel.org/lkml/183d4f5e-e00a-8ef6-a589-f5704bc83d4a@quicinc.com/
- Addressed all the comments from v2
- Added the dt-binding
- Fix alignment issue
- Removed type casting from qce_write_reg_dma()
  and qce_read_reg_dma()
- Removed qce_bam_txn = dma->qce_bam_txn; line from
  qce_alloc_bam_txn() api and directly returning
  dma->qce_bam_txn

Changes in v2:
- https://lore.kernel.org/lkml/20231214114239.2635325-1-quic_mdalam@quicinc.com/
- Initial set of patches for cmd descriptor support
- Add client driver to use BAM lock/unlock feature
- Added register read/write via BAM in QCE Crypto driver
  to use BAM lock/unlock feature

---
Bartosz Golaszewski (4):
      dmaengine: qcom: bam_dma: extend the driver's device match data
      dmaengine: qcom: bam_dma: add bam_pipe_lock flag support
      crypto: qce - use devres to allocate the result buffer
      crypto: qce - Switch to using DMA

Md Sadre Alam (4):
      dmaengine: add DMA_PREP_LOCK and DMA_PREP_UNLOCK flag
      crypto: qce - Map crypto memory for DMA
      crypto: qce - Add BAM DMA support for crypto register I/O
      crypto: qce - Add support for BAM locking

 Documentation/driver-api/dmaengine/provider.rst |  15 ++
 drivers/crypto/qce/aead.c                       |   4 +
 drivers/crypto/qce/common.c                     |  47 +++++--
 drivers/crypto/qce/common.h                     |   1 +
 drivers/crypto/qce/core.c                       |  24 +++-
 drivers/crypto/qce/core.h                       |   7 +
 drivers/crypto/qce/dma.c                        | 176 ++++++++++++++++++++++--
 drivers/crypto/qce/dma.h                        |  19 +++
 drivers/crypto/qce/sha.c                        |   4 +
 drivers/crypto/qce/skcipher.c                   |   4 +
 drivers/dma/qcom/bam_dma.c                      |  42 +++++-
 include/linux/dmaengine.h                       |   6 +
 12 files changed, 317 insertions(+), 32 deletions(-)
---
base-commit: adab295b226c77edf0a90c4c273d6bfed690ec4a
change-id: 20250306-qce-cmd-descr-4b966dc29ac1

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


