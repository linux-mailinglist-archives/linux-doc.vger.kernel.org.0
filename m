Return-Path: <linux-doc+bounces-6369-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B9BB48278AA
	for <lists+linux-doc@lfdr.de>; Mon,  8 Jan 2024 20:38:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4B852B20BE0
	for <lists+linux-doc@lfdr.de>; Mon,  8 Jan 2024 19:38:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 92A5755C11;
	Mon,  8 Jan 2024 19:38:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=posteo.net header.i=@posteo.net header.b="noaq1yqu"
X-Original-To: linux-doc@vger.kernel.org
Received: from mout02.posteo.de (mout02.posteo.de [185.67.36.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C6C355C0A
	for <linux-doc@vger.kernel.org>; Mon,  8 Jan 2024 19:38:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=posteo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=posteo.net
Received: from submission (posteo.de [185.67.36.169]) 
	by mout02.posteo.de (Postfix) with ESMTPS id 4DC9F240104
	for <linux-doc@vger.kernel.org>; Mon,  8 Jan 2024 20:38:05 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=posteo.net; s=2017;
	t=1704742685; bh=KK1Rze8tfOMg6a52THBVx3lgQEQ9wLY2AllK4ufxraY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:
	 Content-Transfer-Encoding:From;
	b=noaq1yquWzfRfgrqVNZJ4H/pbi8Kgv9UNASB1bOc9W2zM6bE8SMKeTF8U9iVGXzQE
	 thrRcF31hzCZk1yDukzFaD1//X+cvUjD4Y1TmcqOmtFOwbnyCGsqK+q2daLkU5g9M7
	 4FCMmlopw4L4wCJH5lWH/zLHpWBhAse1C89MOSMBs38RVAq40VNJs4yONgAM+r7gaN
	 CfAHg8spWJ3fXhnp81gwMkQO5LWvfw28s1oJ91A/4MrVTFJsI/lgjEDHrycni6B+EC
	 XoM/Qu5s4itWK6MGKiTGZPpcifLtJ1rXP5EC5jtznRTntpcaZtaBXsbn0nlzX0/HlQ
	 707Prg7cb65rA==
Received: from customer (localhost [127.0.0.1])
	by submission (posteo.de) with ESMTPSA id 4T84943sqxz6tm4;
	Mon,  8 Jan 2024 20:38:00 +0100 (CET)
From: Yueh-Shun Li <shamrocklee@posteo.net>
To: Jonathan Corbet <corbet@lwn.net>,
	Randy Dunlap <rdunlap@infradead.org>,
	Hu Haowen <src.res.211@gmail.com>,
	Alex Shi <alexs@kernel.org>,
	Yanteng Si <siyanteng@loongson.cn>
Cc: Yueh-Shun Li <shamrocklee@posteo.net>,
	workflows@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/3] coding-style: recommend reusing macros from split headers instead of kernel.h
Date: Mon,  8 Jan 2024 19:37:10 +0000
Message-ID: <20240108193737.189282-1-shamrocklee@posteo.net>
In-Reply-To: <107b6b5e-ca14-4b2b-ba2e-38ecd74c0ad3@infradead.org>
References: <107b6b5e-ca14-4b2b-ba2e-38ecd74c0ad3@infradead.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Dear Maintainers,

In this version of patch series, I drop the patch abouth the nameing
conflicts caused by locally-defined macro variants to streamline the
documentation.[1]

This series of patches targets the "Linux kernel coding style"
documentation and recommend reusing macros inside the include/linux
directory instead of the obsolete header "include/linux/kernel.h".

This addresses the issue 'Irrelevant documentation recommending the use
of "include/linux/kernel.h"'[2][3] and help deprecating "kernel.h".

This series contains the update to the zh_TW and zh_CN translation of
the corresponding documentation changes.

Best regards,

Shamrock

[1]: https://lore.kernel.org/linux-doc/87ederwuid.fsf@meer.lwn.net/
[2]: https://lore.kernel.org/linux-doc/bc63acd7ef43bdd8d9609fa48dbf92f9@posteo.net/
[3]: https://lore.kernel.org/linux-doc/107b6b5e-ca14-4b2b-ba2e-38ecd74c0ad3@infradead.org/

Yueh-Shun Li (3):
  coding-style: recommend split headers instead of kernel.h
  doc/zh_TW: coding-style: update content for section 18
  doc/zh_CN: coding-style: update content of section 18

 Documentation/process/coding-style.rst        | 24 ++++++++++---------
 .../zh_CN/process/coding-style.rst            | 22 ++++++++---------
 .../zh_TW/process/coding-style.rst            | 22 ++++++++---------
 3 files changed, 35 insertions(+), 33 deletions(-)

-- 
2.42.0


