Return-Path: <linux-doc+bounces-24729-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AC4496FD08
	for <lists+linux-doc@lfdr.de>; Fri,  6 Sep 2024 23:07:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 73B0FB211DC
	for <lists+linux-doc@lfdr.de>; Fri,  6 Sep 2024 21:07:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0F0461D6792;
	Fri,  6 Sep 2024 21:07:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=myyahoo.com header.i=@myyahoo.com header.b="YaCrrmHW"
X-Original-To: linux-doc@vger.kernel.org
Received: from sonic313-20.consmr.mail.sg3.yahoo.com (sonic313-20.consmr.mail.sg3.yahoo.com [106.10.240.79])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 356F11D4615
	for <linux-doc@vger.kernel.org>; Fri,  6 Sep 2024 21:07:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=106.10.240.79
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725656845; cv=none; b=KOTTM7u4kXMAXPTkuDrgiBTOer4BcoZSxTwxWJSd+t8cJcEjwBc3L8qOg+w+iUf9D4cABaDryxyTaqY7w86RH2qTKVFutcgoQ+mqqBM5QcICknF4oGOGsAJFNBl7mdANhRCuH5z4ThZ6/ghlXA+kTl6dPcIH8BiR5CiBRRh0VRk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725656845; c=relaxed/simple;
	bh=9iLES3dkWmyBh4NwcYvdX7nP5e5csA5/64UXJbMhOBE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:References; b=l82LhDHmmY40OILRpxzPLtiNf3XFqhASYL7MngnaUbMjsEyQSR7+YIoLvtBM1UvbRWU1q092ixj83cnXlkMUUohDW4l6OQQI/84C2905c8Laay1UKTKDICGp30wGKMPl0+0qD+nicHCIPurpcURP0j6rKO63ZGTOZikcn4ogJvw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=myyahoo.com; spf=pass smtp.mailfrom=myyahoo.com; dkim=pass (2048-bit key) header.d=myyahoo.com header.i=@myyahoo.com header.b=YaCrrmHW; arc=none smtp.client-ip=106.10.240.79
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=myyahoo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=myyahoo.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=myyahoo.com; s=s2048; t=1725656842; bh=awJ6MhJmZhkmmWzLZ7jdz51ALBXVdPkmU9GJhavpEv8=; h=From:To:Cc:Subject:Date:References:From:Subject:Reply-To; b=YaCrrmHWI34VSP0NxEIRLx1osmuH+AUl3RUFjco/HSt9y2w+R3jyswl4140xCS26WT9B6sF2KXColBwdmL3+WOwKkIaQeeDiZnQqHaY4faowL9jHUWtZM/YSdfHPRtmoCcyzItkMGJqBHdWMpmHe+jLKmQiqIf73V7xfpnwE8vaJ5DrYGCMBQGHvKM6CnWQpD+RMTjUGs7uY162ZTYD6WivX3IvSrZZdGMBlw5wvojVi+0eYQB7sqk03xJOws5w3mmPDhcKD4l+wuydxZA+YL4JZAnjyRBUN9BDqKuTzJXYd3UTx9mOmYMfn26u1kFP8Weg+VcBQ7A0kqo7Gl05Giw==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1725656842; bh=E1jti1PlfGD0ugTWPKsRTWynOkMwXUF9edUCQjQ7iTk=; h=X-Sonic-MF:From:To:Subject:Date:From:Subject; b=GSAMnjnVMco5OeUPQIZ+684WjgZq9+Bb1xegtiYZ9Wc1loP1RfQFxn04GNL8+mTWOhAddNjz0Onym0P5/KkCrimQYx9kg5aM6EApFGXgZGvv5kQRgkS+eSn95KmtTM/FLwgSxXEISEeuJkNPf04TqqfbN6bulEFy58hozZ9kxwlrhfnylRHqizPnw966Mi2KWWtpzCJ8gGpIvizyXsdredeRWgKMpa+oa2JEwf3cEwFJ9bSv5kUdjJMQ6n82yxis9nkazc+OWPgWynLt9v7XA+HmYcdrdSdyBFdcFFtUg+Hh5hQt8zBrPVQYfT8ZjvnYIcERbyd9JEjN+fbbQJoBtg==
X-YMail-OSG: Z6W6wCsVM1nWQv0sVVX0tq2hYzmYBa2fdzOtVcQZwYBXj5XWepWaB3l4c6BivL7
 VZfujvgZKmJWmOlz1jgaQjPbzT2TUy8_6V5svWV3aldHdTKwmHJKieHswtiXn6ZsqnUXvhzD6G0r
 rU3SNHFed.JrN_xDnAuZPHr.b5fCXVTqUTChnPuXbbpPap95EUEsPduxKe7sj163WRWwiAy6vwbC
 OczADWC2bu6RbcT6V7h2vpvnNMcsD9RL8GtLt4IgTcDLQolJC7N3DgaFhbdyuIY8oJE06ukXOYYt
 FIINi1kNMdHLOBj8_CRvUVDsZ__kK97OVhFRQBikZyWRh5HvWoaus552SAGuiQTeQQgA72TQTUe2
 MK3rS1r9DK3p0S.hU0AQ8XvhI20qPW4ubpgSVzR8DIoGTMxLd3y0lCRNVrXusQJmIkJuYR5zzRDJ
 _UKkf8lx9hQGF8iKoCpm57KRNRNsbpRF8ynLHik0sMTW0SIN1tXuler9mOEhiusykC8lf9YeGByJ
 rkuWDwu5qT2hwCojlQnB8xZ6emlcHNjJK_0pTr8TUARvX1q4KkQ6L4vlLjy3upgTJQTry24s7C4E
 HvBwQVyT0NrYwi6n7s6ejJ374L82.upPx378xsDDuelK4lgPL7Way5B6M2kJeVg9OTUtZQs8vSiG
 6JgxQ0THGxpdXNHvlXgY9sne_C0WU2r.U2_6CJVY7j1KD6XIAFSM2PhOBX8pRUKreFSCjFZwJyLh
 J0icuCz.SN7a6zFsjg21ztX5jpO3zqBv_N0.l0axDC_4R3IhkUNohr4heRBTFhsru6iScs95_4Ft
 TdseDYATdoaB_lW8OxnbdHM8g07eEZrXe2v8cd9KzlIXDzaop7NdRTpMY8tyZ4P0AXSFfDACekoM
 rdstcGKVE0amWPrxUlUNSj_zBUexiHceaQTEy8XSSwq3xi1_b1dij888BNLrsaae0btL_yS17JW8
 .SHQj9Tvv_cDgUqqtK7VQmJu13A7nmYwlJKP_loFPsmKnfniznnDfU3JIFYbSIV7tleuiunilc_3
 EW1vAIpLAKo7shxCK9m3IDHvW67xCTOOawBKHEGLGPpf0mz9tvl.N_TYvKgjE5NmTk6nf8x93sTz
 6S0iGZXysM5TyWb_Y.moqqkM4P7hChSDcxRzDuhnT1EbqAKVzeE8vsdXDJdMWGNSQekO1G4RXiNh
 XfwGJ1jSmLqaRKEF0tVjLD5aBIX.6vJcAeNso2Wu8njZ.Q1WPI2gScgFDzkCHAMGVK62o6RO4yb_
 go_Es0LhFIQ5qlHAejFtplDbCD5nTgQmfwjo9MoroL3YK0Fg9BgL50s.4DVJgaZJ92CDDNcMW87V
 CYKK7HWV1jDFxumLazYidB0OxTD4d8W96vnDd_nA4W8GG.ani_x5jTjL5jITKlpLIuBP7zZjIMko
 ADndDIK33CIluOcCgmUFuvLmSkjwl1_yDXFTWl7pEEHe9TmE6Y9yEAFKdAHj4B8JLcQO.FymI0VB
 FJagnYEBENC0uvxvE05sj8nLl7DsdajUVJLR.FkruTfTVsELBQ4p9tDExHOuTv53oWeCwGE70ADk
 q3ng_3MewmcZpmP9QWZBIwNJOunGNNPSp.m1ReRduATaFrSkj9EyBhF6E9l782uXfvT4Juz2SH5o
 Ghmifc0F.9S03IKW8Diu5mVk3U7aRSqxAhXVVvCv3pinASxj6P0EoCnO6EVGDdh3qlDXMj9UqPff
 o4U5Nk9icZHP.l7mx4Ory1W7qEsAw41uyAXyNtszlJmQRGiSwi0jOpS3X6WkfTVef9eLbMDJ5_iY
 wUcOdDSzTGVXfHWVRMO_RMVhFT7MAAueBSXM6K8gESIfpQy8aCkG9E3oZBbI0R1aZ9_7.khx6q6i
 8lVQWGKb0esLU6.oPA83VucVRHbm3sUHRhzWU8oDN4YpU2.hz0p9_pT3gILFpXm5hcSFiojkapbm
 KYbCRso2jQf5A29V_NbEe6fXt5sCaJj71gXF7DbUf0Xle9CJ_Rn7OuGU7V7TbCqTBr3JOvfgF0c6
 FuwGzYnrm_cyhfXmtwCuKryV.TxBHR8FIoF9D3xolW.L90PyNYnnKmjsTy79xdYYI2V24.P_FBoi
 id1q4KscEdhSaFSa0wPnPH72WxbFfnqUF5YqpX8s0uaW.25rhIfzrigVk9knZAGaVGlZww.YcLKm
 fGd3QycUcktvVXixTl0Fbu_3Y73c4qwx7MXbEizA3TiyQTyustdZ3Rs0SELZFcuzNmPSH9XLipgX
 BIOWPAj2ylzW4h3fbO6OFiQBrMhxVRqC__vihq.gzWh4aD49bChVLNJTwPmAQ1Q--
X-Sonic-MF: <abdul.rahim@myyahoo.com>
X-Sonic-ID: c09ad32f-2021-4edb-a6dc-1d43a6352aaa
Received: from sonic.gate.mail.ne1.yahoo.com by sonic313.consmr.mail.sg3.yahoo.com with HTTP; Fri, 6 Sep 2024 21:07:22 +0000
Received: by hermes--production-sg3-fc85cddf6-kdpzj (Yahoo Inc. Hermes SMTP Server) with ESMTPA ID 412f38eebffa696b3206e5fb186b72bc;
          Fri, 06 Sep 2024 20:57:10 +0000 (UTC)
From: Abdul Rahim <abdul.rahim@myyahoo.com>
To: bhelgaas@google.com,
	corbet@lwn.net
Cc: helgaas@kernel.org,
	linux-pci@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Abdul Rahim <abdul.rahim@myyahoo.com>
Subject: [PATCH] Documentation: PCI: fix typo in pci.rst
Date: Sat,  7 Sep 2024 02:26:56 +0530
Message-ID: <20240906205656.8261-1-abdul.rahim@myyahoo.com>
X-Mailer: git-send-email 2.46.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
References: <20240906205656.8261-1-abdul.rahim.ref@myyahoo.com>

Fix typo: "follow" -> "following" in pci.rst

Signed-off-by: Abdul Rahim <abdul.rahim@myyahoo.com>
---
 Documentation/PCI/pci.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/PCI/pci.rst b/Documentation/PCI/pci.rst
index dd7b1c0c21da..f4d2662871ab 100644
--- a/Documentation/PCI/pci.rst
+++ b/Documentation/PCI/pci.rst
@@ -52,7 +52,7 @@ driver generally needs to perform the following initialization:
   - Enable DMA/processing engines
 
 When done using the device, and perhaps the module needs to be unloaded,
-the driver needs to take the follow steps:
+the driver needs to take the following steps:
 
   - Disable the device from generating IRQs
   - Release the IRQ (free_irq())
-- 
2.46.0


