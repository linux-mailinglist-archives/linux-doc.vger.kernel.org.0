Return-Path: <linux-doc+bounces-24106-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D468D964708
	for <lists+linux-doc@lfdr.de>; Thu, 29 Aug 2024 15:42:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CF9171C216C0
	for <lists+linux-doc@lfdr.de>; Thu, 29 Aug 2024 13:42:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BE9361AB505;
	Thu, 29 Aug 2024 13:41:28 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from michel.telenet-ops.be (michel.telenet-ops.be [195.130.137.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E75C1A707F
	for <linux-doc@vger.kernel.org>; Thu, 29 Aug 2024 13:41:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.130.137.88
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724938888; cv=none; b=X5rgoNZcD31fb8IpkcY+qMw8FMUJy+jhECcxT/PXMMG0QNZZg0NfoBkLKHOWccT3m+xG7Xb70Br3qb1Bm4+hlMJjiqnDZ3XMXn/w6hmFwDEpWm6vzPqT2pf7bqpKP6YYpk/VAq8RZtPhdsnhsFEmqq/1C+T/rlzmELkvc8hMZ3I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724938888; c=relaxed/simple;
	bh=j15g7+Zs11MXgNdFt9xjPzQq0JE/TjMvjYfFKO5EiIg=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=mCE4whHpYARrjWQHAxs3uUbCApJshvcr7lwVlwuew3/LY2ghihyIYJn3TtJdqnLbuK7BTGOITW97UZ0a2Snrqvj/u7nOH/CQ3NecF6YtPzh1/ad47B2FXNxnvWXqaTH5IukIT+t4py9cIqJSVWOpobrX7WzrrDUi1QLtlUdMoXM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be; spf=none smtp.mailfrom=linux-m68k.org; arc=none smtp.client-ip=195.130.137.88
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed80:fbdf:b855:e99a:9ec0])
	by michel.telenet-ops.be with cmsmtp
	id 5phL2D00Q0Yrr4n06phL2C; Thu, 29 Aug 2024 15:41:24 +0200
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1sjfOn-001GR8-Oo;
	Thu, 29 Aug 2024 15:41:20 +0200
Received: from geert by rox.of.borg with local (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1sjfOq-0002Uf-Dp;
	Thu, 29 Aug 2024 15:41:20 +0200
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alex Shi <alexs@kernel.org>,
	Yanteng Si <siyanteng@loongson.cn>,
	Jonathan Corbet <corbet@lwn.net>,
	Andrew Davis <afd@ti.com>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: devicetree@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v2 resend] docs: dt: Update overlay file extension
Date: Thu, 29 Aug 2024 15:41:18 +0200
Message-Id: <4661808d64fe4cb53ec3f291045f62256c7a7755.1724938789.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Building DTB overlays from .dts files is no longer supported.
Update the documentation to reflect this.

Fixes: 81d362732bac05f6 ("kbuild: Disallow DTB overlays to built from .dts named source files")
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
Acked-by: Andrew Davis <afd@ti.com>
Reviewed-by: Yanteng Si <siyanteng@loongson.cn>
---
v2:
  - Add Acked-by, Reviewed-by.
---
 Documentation/devicetree/overlay-notes.rst           | 12 ++++++------
 .../translations/zh_CN/devicetree/overlay-notes.rst  | 12 ++++++------
 2 files changed, 12 insertions(+), 12 deletions(-)

diff --git a/Documentation/devicetree/overlay-notes.rst b/Documentation/devicetree/overlay-notes.rst
index e139f22b363e9f36..35e79242af9a928d 100644
--- a/Documentation/devicetree/overlay-notes.rst
+++ b/Documentation/devicetree/overlay-notes.rst
@@ -38,10 +38,10 @@ Lets take an example where we have a foo board with the following base tree::
 	};
     ---- foo.dts ---------------------------------------------------------------
 
-The overlay bar.dts,
+The overlay bar.dtso,
 ::
 
-    ---- bar.dts - overlay target location by label ----------------------------
+    ---- bar.dtso - overlay target location by label ---------------------------
 	/dts-v1/;
 	/plugin/;
 	&ocp {
@@ -51,7 +51,7 @@ The overlay bar.dts,
 			... /* various properties and child nodes */
 		};
 	};
-    ---- bar.dts ---------------------------------------------------------------
+    ---- bar.dtso --------------------------------------------------------------
 
 when loaded (and resolved as described in [1]) should result in foo+bar.dts::
 
@@ -88,9 +88,9 @@ in the base DT. In this case, the target path can be provided. The target
 location by label syntax is preferred because the overlay can be applied to
 any base DT containing the label, no matter where the label occurs in the DT.
 
-The above bar.dts example modified to use target path syntax is::
+The above bar.dtso example modified to use target path syntax is::
 
-    ---- bar.dts - overlay target location by explicit path --------------------
+    ---- bar.dtso - overlay target location by explicit path -------------------
 	/dts-v1/;
 	/plugin/;
 	&{/ocp} {
@@ -100,7 +100,7 @@ The above bar.dts example modified to use target path syntax is::
 			... /* various properties and child nodes */
 		}
 	};
-    ---- bar.dts ---------------------------------------------------------------
+    ---- bar.dtso --------------------------------------------------------------
 
 
 Overlay in-kernel API
diff --git a/Documentation/translations/zh_CN/devicetree/overlay-notes.rst b/Documentation/translations/zh_CN/devicetree/overlay-notes.rst
index 43e3c0bc5a9f8235..ba5edd05dc1e7fd2 100644
--- a/Documentation/translations/zh_CN/devicetree/overlay-notes.rst
+++ b/Documentation/translations/zh_CN/devicetree/overlay-notes.rst
@@ -43,10 +43,10 @@ Documentation/devicetree/dynamic-resolution-notes.rst[1]的配套文档。
 	};
     ---- foo.dts ---------------------------------------------------------------
 
-覆盖bar.dts,
+覆盖bar.dtso,
 ::
 
-    ---- bar.dts - 按标签覆盖目标位置 ----------------------------
+    ---- bar.dtso - 按标签覆盖目标位置 ---------------------------
 	/dts-v1/;
 	/插件/;
 	&ocp {
@@ -56,7 +56,7 @@ Documentation/devicetree/dynamic-resolution-notes.rst[1]的配套文档。
 			... /* 各种属性和子节点 */
 		};
 	};
-    ---- bar.dts ---------------------------------------------------------------
+    ---- bar.dtso --------------------------------------------------------------
 
 当加载（并按照[1]中描述的方式解决）时，应该产生foo+bar.dts::
 
@@ -90,9 +90,9 @@ Documentation/devicetree/dynamic-resolution-notes.rst[1]的配套文档。
 DT中的适当位置。在这种情况下，可以提供目标路径。通过标签的目标位置的语法是比
 较好的，因为不管标签在DT中出现在哪里，覆盖都可以被应用到任何包含标签的基础DT上。
 
-上面的bar.dts例子被修改为使用目标路径语法，即为::
+上面的bar.dtso例子被修改为使用目标路径语法，即为::
 
-    ---- bar.dts - 通过明确的路径覆盖目标位置 --------------------
+    ---- bar.dtso - 通过明确的路径覆盖目标位置 -------------------
 	/dts-v1/;
 	/插件/;
 	&{/ocp} {
@@ -102,7 +102,7 @@ DT中的适当位置。在这种情况下，可以提供目标路径。通过标
 			... /* 各种外围设备和子节点 */
 		}
 	};
-    ---- bar.dts ---------------------------------------------------------------
+    ---- bar.dtso --------------------------------------------------------------
 
 
 内核中关于覆盖的API
-- 
2.34.1


