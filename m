Return-Path: <linux-doc+bounces-5155-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9703A813E99
	for <lists+linux-doc@lfdr.de>; Fri, 15 Dec 2023 01:14:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5210A280FB9
	for <lists+linux-doc@lfdr.de>; Fri, 15 Dec 2023 00:14:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4BC9A10FC;
	Fri, 15 Dec 2023 00:13:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="OxqsLOZa"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D950B10E1
	for <linux-doc@vger.kernel.org>; Fri, 15 Dec 2023 00:13:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-1d0bcc0c313so133865ad.3
        for <linux-doc@vger.kernel.org>; Thu, 14 Dec 2023 16:13:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1702599236; x=1703204036; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=cHIT4/zAOsjoCOmWaVZrUI8chkh81MpK3rRyl2+SwGk=;
        b=OxqsLOZaRjzy0Xhbsa24tmzk1Ln3aImW0Ng/IaxjTr1V3OV91TaCNyaRFX9N1lBo6t
         VYQT4/DQZDdQCFmC6e3dQI3FEOBXuCU3HK9CWI/UWMKIJus6N8Qk1frP7DaslyOiVipu
         uwtUX1qFjhLzg1GRbtJ4zxMyCGIo5ujUJaXxY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702599236; x=1703204036;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cHIT4/zAOsjoCOmWaVZrUI8chkh81MpK3rRyl2+SwGk=;
        b=Jg27nM3136xruGZ/z5jXyQtbx5Xd0ge39Q3Oa7DvO71fvGPP4bNMcN1++ZaXWBjZoN
         vEphXibNUqfE1e7V+6G/Oij3gE8pKMimLtxaWF4ISLwy1WUJb48Lxb6CW3URfMW9w3rc
         Y1HkZMcvO2Mxy4aHlx+rJdqdepehvRmpnsmzm6MC5/uHkvS/CybGn+TugEqQyHccgD4D
         lupeGAxBVicP77gbViIToTazh2dc7m2KcvY4ycC6Kh1/kIq+RxVRLzqmc0CIDGBPiwwC
         1c/VjntawAjx7amTUBnSDXFKaDub63pLyoz/DhGeVT8OMZRyzgIcbQP1mf1GwDL20H23
         KqKQ==
X-Gm-Message-State: AOJu0YxwQD5Y6SJrQyVOD21Hsx3/Dngbg1Tz3Q8Wxo6yElnrgInvj2NW
	LGwDmy8uwbMqn/lbT7ylj9SEAQ==
X-Google-Smtp-Source: AGHT+IFqYwTy/BdDggnEbc0pQ5/tR/p0topWm9Bn0nmNH3t4LjpE7I5FtQpsSLTeJGpG/xwpUd8QSg==
X-Received: by 2002:a17:903:1206:b0:1cc:70dd:62c3 with SMTP id l6-20020a170903120600b001cc70dd62c3mr6192101plh.30.1702599236263;
        Thu, 14 Dec 2023 16:13:56 -0800 (PST)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net. [198.0.35.241])
        by smtp.gmail.com with ESMTPSA id 13-20020a170902e9cd00b001d33369bd86sm6043400plk.194.2023.12.14.16.13.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Dec 2023 16:13:55 -0800 (PST)
From: Kees Cook <keescook@chromium.org>
To: Jonathan Corbet <corbet@lwn.net>
Cc: Kees Cook <keescook@chromium.org>,
	kernel test robot <lkp@intel.com>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	linux-doc@vger.kernel.org,
	linux-hardening@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] docs: conf.py: Ignore __counted_by attribute
Date: Thu, 14 Dec 2023 16:13:54 -0800
Message-Id: <20231215001347.work.151-kees@kernel.org>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=932; i=keescook@chromium.org;
 h=from:subject:message-id; bh=B2tqTdN1yLmid/EvyON0m6Bfx8ewzrdTGIvQQwD+wX0=;
 b=owEBbQKS/ZANAwAKAYly9N/cbcAmAcsmYgBle5pB94LTh/NaR3Tal7Cmsx2UUklX8ibKe88nW
 Ri1Cv3sHM2JAjMEAAEKAB0WIQSlw/aPIp3WD3I+bhOJcvTf3G3AJgUCZXuaQQAKCRCJcvTf3G3A
 JmLJD/wMo4+veMXHS0H1dNZxX0gG8ziwAaIX0G6s5TbvI34upjeUlVz7mg7moCz5hBpc2Vvds3R
 NjflzseoIBGU+WKdpikTaDKH7Nx/sv5mRQumrFCQHkBe8axEBRer/616+QRNUo3HLsV1SkOALjv
 i4s2F2J+FHW/JoY5YjhRAAKuSog/xKoVEXoh8AvvBgzExTt0l02MDrAEUeZps1HffepMjtPvMXW
 xYvpN7XHS5tOT9jz46YPqQbmAHT7ji8LEvA7VbYLWZHn4gYBj/Vla18GaVe8dQRVmitQ7nnWuxf
 A/vupnFw0Ah0m4FX5E1hBbtJi43lrWIEc4u6aOKUnnim6HgAZtzYQ8aEFAwbXm9jhInkFvNx4yP
 mYvcqWlIvuKC5aVC2yiOCRvBVMoRStj4KK3+BH+hAA+tk8i4n6ApgQzHTu4gJHBpRhiwMwytRH3
 TNjvydi9A+MMkSLz1+2ISiYZy+lfw/yfs75+992QKXZT27DaI3ZXiBNhQk51QXoLQ7TONfYGS3y
 oc+GFG5qHO7es33mud4hZ2PuHMLmbItow+duptqdBBcst/THrfhNPj22T20O3JQRXn8RnSPNhKY
 4K0e7FsC52XIuRl3NAdeuIOaRY6QNIP7xvt22K2d7RloHaCg5AxWViFiKb0t+lS+24LXg7p/2J1
 LzSBUzZe 9aquL5A==
X-Developer-Key: i=keescook@chromium.org; a=openpgp; fpr=A5C3F68F229DD60F723E6E138972F4DFDC6DC026
Content-Transfer-Encoding: 8bit

It seems that Sphinx is confused by the __counted_by attribute on struct
members. Add it to the list of known attributes.

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202312150614.kOx8xUkr-lkp@intel.com/
Cc: Jonathan Corbet <corbet@lwn.net>
Cc: "Gustavo A. R. Silva" <gustavoars@kernel.org>
Cc: linux-doc@vger.kernel.org
Cc: linux-hardening@vger.kernel.org
Signed-off-by: Kees Cook <keescook@chromium.org>
---
 Documentation/conf.py | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/conf.py b/Documentation/conf.py
index d4fdf6a3875a..5898c74b96fb 100644
--- a/Documentation/conf.py
+++ b/Documentation/conf.py
@@ -106,6 +106,7 @@ if major >= 3:
             "__weak",
             "noinline",
             "__fix_address",
+            "__counted_by",
 
             # include/linux/memblock.h:
             "__init_memblock",
-- 
2.34.1


