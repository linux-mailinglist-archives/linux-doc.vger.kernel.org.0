Return-Path: <linux-doc+bounces-24684-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3421496F4C3
	for <lists+linux-doc@lfdr.de>; Fri,  6 Sep 2024 14:56:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E6A71282AE0
	for <lists+linux-doc@lfdr.de>; Fri,  6 Sep 2024 12:56:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E01BD1CBE98;
	Fri,  6 Sep 2024 12:55:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=myyahoo.com header.i=@myyahoo.com header.b="N2dnlkDT"
X-Original-To: linux-doc@vger.kernel.org
Received: from sonic310-19.consmr.mail.sg3.yahoo.com (sonic310-19.consmr.mail.sg3.yahoo.com [106.10.244.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD3AE1CBEB5
	for <linux-doc@vger.kernel.org>; Fri,  6 Sep 2024 12:55:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=106.10.244.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725627348; cv=none; b=mwKrqPYmNZfoBYCAlcEWNm4YFAZUrtt+ODWZsLLpJRM0jQC3NWnT+lY8dBOjQg4/IGeDE/g7tfZ9MNIOZbgoMv7r3ydvV0aKwdU25fpd0NMPQ6X2lIu/JQZh5p2RrITymB85D4vpPg0+el0Lyvl7AiCF2iqEab0PNt/EsOWtjqc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725627348; c=relaxed/simple;
	bh=qmWrAIZu5iSuMOs78IMq7mw1QxQ2rtIiXykTLxfkJMo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:References; b=ekXO40ELnuWRfPg9Spd+Z8R7CfZDOMpIIEFOtBGYO/+vS9hGrIDYQHsDm2Y7SiCqYzmVIqwO4VMk1CGc/zRUY09icaZ0Pu3LfJROmwWLIbeQ36f9Q8GdeICGsDxt5mgC3+83oChAOajA3Q3BIhWyq6Cjpmu3oF0yYHLnceuxsNI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=myyahoo.com; spf=pass smtp.mailfrom=myyahoo.com; dkim=pass (2048-bit key) header.d=myyahoo.com header.i=@myyahoo.com header.b=N2dnlkDT; arc=none smtp.client-ip=106.10.244.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=myyahoo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=myyahoo.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=myyahoo.com; s=s2048; t=1725627345; bh=Ie2y1TiUEKPKXT8hNmOxB3fbFuOwlG7O5EiFvueE47A=; h=From:To:Cc:Subject:Date:References:From:Subject:Reply-To; b=N2dnlkDTaF7T4sLHwRCJUfZZqqRtE6YX3SLH4KhhoaBtWdbCCVhvvR3paErUf5VpI8U+6xLedEUBCblmMFfAKTRN7RjbXtNB+NnjpM8qS3HUB42X53Wnlt03j2NhHHkfxtSwKOuHErHqUm1WAyYkS0htwvShVMxz3Vw3sq87fyYKgznv069iH0Cht6EhaWk97Pz1hCdHbWySN1MtirgHz1sZXBW1OeNpQV/YRqTo0Oe+WKo+v4ofocVRNfzTBzZR5vzK2KMqdrAz1OClXCkSv+ZLdm4cdjUP+iES+3zIB1/gA3Mw24eYXpt8UkVFs+5rcuML1Oxl+vrGZHcycrnyWg==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1725627345; bh=Jryzu/ulz/nvtujiQLq0Qsyb/PdyOq+RksJVySh74V2=; h=X-Sonic-MF:From:To:Subject:Date:From:Subject; b=l/3i6PnGJpz+OCHz/7Vr5O4DEohjVD3eUsCpAErk+E0yyI4V3rapd7WE4EYOrlhTAPNUC79WUe44iN8PKSs4zLBTFCN44YsK7VzsLj0913VU8oR8x/TCKRyu12LxO+NCIzkEia7bfOo299uk6KwUWcIJmPbua6eqWd1pJNS7ufV0mlqehpX8mVGIH7LIJWZiLAg0cQantmftWxlMWcyVdd2uVi4aVEK2YLyEjxmJJtb3sQqw5OttLg+UFEY5hEvnx/PQoAQEjTIPNuDqglH7YiyvppQ6dRYupwI6mMKMrwph7F5RRKHvnOaaAwk4FuAShw5Isq60dmrDYNu/Q90+eg==
X-YMail-OSG: wVsCtLAVM1nk8XKr5sBeyC5thEmxxcegSNZq6zEwjPYLNkxmYLDNp99RlwdhFZS
 7YlAz15amPkjU56hykk89oyJx5vjVhtUZ2fYiaregTbIde3oRJSqEJQJvPgMnQlkcz16cK96aGXz
 .6yZyBTNcrbP3Vhm2yLFybNaF4ri2yVOf6XxykGkwS_j6fspryLY.bfkjiIsslahYK1Qkm2beq5n
 cu_KnPjUUmkjfieGWdHl0EL1xPKJ54A62914qG7J2k10otjHpucNljSaRZGA943yFlHZZqtUhP2P
 ToehxiPneHdWGsfUhd7igF_TLcSY9sZZd1aF.3h7nagybcU4C5CyVtBBp2I65clGePhRqhF9Dhn6
 KxL2tqR1Pwrb14x3jK4q88MPJVDNgqMUc6_QVycXu3e5Oj9au50BN3YCmsfzz3RI.H6adlgzQuNA
 e1gJThKTeBh8rE_7RRzk2jsnCZamZSRl9N8r1RK0Sfe_qklQbXswO14JCoxLf9UplsExV7v_58hk
 0_xXJmiQTq9prhQ912gabTSqHpoeOsLnjDqwINkwBZ_kPoOoLby19zd9fMj1geQO4LaDoDJ3kVZ8
 LBF1EDxNsofbA9WV7qT0e4TQz_bgwvHiCl.BwBwiNA0b00lN9wuawbvAEXJNl9oakIxMStP.HzLx
 xFcFYcxjrBbo_aQIhoLLypLAAE4BkbR0CnjMym4mGvrGDIQyiywgBww2k.20YcwvJLElquIg21Xo
 8tLViLjeMPe_w.cCZnN5mAkuwR1HINt_zNL14FfQhMYqircDRHom3gE8X0f_vk7eJ0xm9FPluKmu
 5FXJpbDWFNIFUIJOUJmcm6ukAHXz4JSshjYG6N0cKtRtcdX2ca.as1iGfZnQ3N2NOPuJGLtbIWLJ
 87_zPLaHuovT81FxxzVXFQXyJ14uTpmOdqm.DhM2IjjxLDKgvtdI1BfiY6A2iznCJMY8RRpTtrYG
 JZVfVHdmdZZjmQmVMplG9PwVwdrlBC6_seWB0MXflli.HjG_gJ0Wf3k24EuHAFysCtf8T48Wb5Ns
 ntSJSjmZ0I8z2YfnNbUlyritBCJCZG._JTgrjUgbKsw6JXryu6y5.QM1q5bab.RxUuCVZwdYoY6.
 3V_JsQBxe8lHi8YjPGmX24DIqCVgsqapvs83NK0pWVJvphnm8fIjti6w0G3YLda9oLck1Lx2QCi5
 K0ljZ9NX3d_32xx1UaY09reQpsiVS50iDEJTx4PZ_.atfGaEu1ONwcMxxetHeUylR4JW3eHXOKtA
 anJm..hEqLua6N7V7SME.pZ9rGQnYAgbNN_vRnzoa5KkQYQA4xArMRzCiv..1M3V9vLgWfl6WL9J
 tK5wdVnuLZ_bZSv6wbp6T1UGpslnPuGae6WsCcNXNV8Hw01wChTMv9pfJ1tZ7W6afSN3f13O4ruQ
 LEKFlKxPUrfLz0SSLXf_.R14wfDBxG5IevB8S7VcsNMtskTKNwSL2FAA_CJtc0vdjtmiuHTcAJV9
 T7efPD8jzqo5CRf2wjgf0kMfFWGTe9oi2R_p4EP4YsAHAGQ_agsB1waR9ZhjpiSeAY3Y_nwsV_1m
 Hrf9l0gkQqsK0ALxOnkgb4zp4RPNVPexl1LWjsvdOB0CBIsO5rWotnlZ.K3euXkMTiTvokLCVc2S
 e4tAfdQSXgg4Cctb64lOF8ZEsL_.IruUFrOV.aWBg8nX3BDMlhhsIQGrFJVCNRkGg0rfAHCI34gK
 UaP8R67ZsMOGQBvYdE6BSS5C2R70j8Elo_HEUUxxP13lwU1ftxnYV4ItP.afHt8bE0C6jZ25QCui
 xfk5Qu0PT.E1OD6NqvHCiZwm4VbTTgTCs1kxHjDU5PxRw4dOsQG3zJXbj12rkli56uVDmpUTvTe8
 8pXSALdZynLuOu3Eao6ane78H5vLBhAFwNTS.j0NPD4cWpamXTBPwysSK98h8hC51B_f3aSCg7l3
 VusOBJP3siRy0FDK2pvUPWHfhzeLzHqeta_eDRj1MDmYmy0_wpZXpR2NxK.FjCKVg_9JggTMWxWD
 ggDK5gIKpTaLruwXVbfX8DcAnxtVac67Hy1iUDKqJWkudYH4GfI5TSbPLbqwOq9z.i8pdO.TQKnN
 gYZuWdlduBUuWsDRvXZ2wwgXFiyerG65JavmJktDPPCKq_rokRnMGlkOW2yu7tfqYyvT5R78ymK6
 VMXwHX3T9Jhirh89ehHe8eqFTlIEpofYKgIvuvDUXOdFOQMmuniHTRem1qPBrhdCp3Vrn6lhnua_
 qurbvKOud4RZkUrr.DYo2vg7Pf1T88xYF0Qz.PXPFcu0p8iIH02hO06EQqlao4zoR
X-Sonic-MF: <abdul.rahim@myyahoo.com>
X-Sonic-ID: 011fccbe-b5a9-4423-92b0-e4490bb0393a
Received: from sonic.gate.mail.ne1.yahoo.com by sonic310.consmr.mail.sg3.yahoo.com with HTTP; Fri, 6 Sep 2024 12:55:45 +0000
Received: by hermes--production-sg3-fc85cddf6-flkd9 (Yahoo Inc. Hermes SMTP Server) with ESMTPA ID b2af45da1f26bfea588bc7caf835a39f;
          Fri, 06 Sep 2024 12:45:33 +0000 (UTC)
From: Abdul Rahim <abdul.rahim@myyahoo.com>
To: corbet@lwn.net,
	bhelgaas@google.com
Cc: linux-kernel@vger.kernel.org,
	linux-pci@vger.kernel.org,
	linux-doc@vger.kernel.org,
	Abdul Rahim <abdul.rahim@myyahoo.com>
Subject: [PATCH] PCI: Fixed spelling in Documentation/PCI/pci.rst
Date: Fri,  6 Sep 2024 18:15:18 +0530
Message-ID: <20240906124518.10308-1-abdul.rahim@myyahoo.com>
X-Mailer: git-send-email 2.46.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
References: <20240906124518.10308-1-abdul.rahim.ref@myyahoo.com>

Fixed spelling and edited for clarity.

Signed-off-by: Abdul Rahim <abdul.rahim@myyahoo.com>
---
 Documentation/PCI/pci.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/PCI/pci.rst b/Documentation/PCI/pci.rst
index dd7b1c0c21da..344c2c2d94f9 100644
--- a/Documentation/PCI/pci.rst
+++ b/Documentation/PCI/pci.rst
@@ -52,7 +52,7 @@ driver generally needs to perform the following initialization:
   - Enable DMA/processing engines
 
 When done using the device, and perhaps the module needs to be unloaded,
-the driver needs to take the follow steps:
+the driver needs to perform the following steps:
 
   - Disable the device from generating IRQs
   - Release the IRQ (free_irq())
-- 
2.46.0


