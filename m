Return-Path: <linux-doc+bounces-32545-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 64AB09EE22E
	for <lists+linux-doc@lfdr.de>; Thu, 12 Dec 2024 10:02:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4CD74168DF1
	for <lists+linux-doc@lfdr.de>; Thu, 12 Dec 2024 09:01:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 735B420E6E4;
	Thu, 12 Dec 2024 09:01:30 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from andre.telenet-ops.be (andre.telenet-ops.be [195.130.132.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9FA320E6EA
	for <linux-doc@vger.kernel.org>; Thu, 12 Dec 2024 09:01:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.130.132.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733994090; cv=none; b=n/VxCtk9BbXcBLj+QCZrF7TUO6j82w7Ueqt8c4EA98R7yoBiPqOaxlGvhqwpx52Tj2dBf8UTSZE4nreVRgY5ymZEKBHOTk4ho0X4sB2ivCNiHViOYo+F3z04qxcIKTdqMzz5zSt3fLR4nXAMFj66CZJY6cbGwzxwQ1SK4awLuDQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733994090; c=relaxed/simple;
	bh=j15g7+Zs11MXgNdFt9xjPzQq0JE/TjMvjYfFKO5EiIg=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=ZLzl0wweJYjHb3UVpOLPr+vuVmQNskjWvBl+5yTPeamZlPJoMEyT9WEx8KzgV/OcQV5krS/fsF5QchR7HLbAlbENQKqS85jxuBWCArCCe9bTZzmrRVFI5OnQsjfsHiCyoNdFYWCmZPhV8mbk1QQLWQMNKghdk+aQlZ2TGEj1DPA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be; spf=none smtp.mailfrom=linux-m68k.org; arc=none smtp.client-ip=195.130.132.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed80:a086:deff:83e6:222b])
	by andre.telenet-ops.be with cmsmtp
	id nl1E2D0091T2bNC01l1E1c; Thu, 12 Dec 2024 10:01:20 +0100
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1tLf4J-000pxW-F0;
	Thu, 12 Dec 2024 10:01:14 +0100
Received: from geert by rox.of.borg with local (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1tLf4H-00DEXi-0G;
	Thu, 12 Dec 2024 10:01:09 +0100
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alex Shi <alexs@kernel.org>,
	Yanteng Si <si.yanteng@linux.dev>,
	Jonathan Corbet <corbet@lwn.net>,
	Andrew Davis <afd@ti.com>,
	Andy Shevchenko <andriy.shevchenko@intel.com>,
	Masahiro Yamada <masahiroy@kernel.org>
Cc: devicetree@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Yanteng Si <siyanteng@loongson.cn>
Subject: [PATCH v2 resend 2] docs: dt: Update overlay file extension
Date: Thu, 12 Dec 2024 10:01:07 +0100
Message-Id: <a3b98f8590b834d090fc0c7faf6fd0f8d6078e8c.1733993924.git.geert+renesas@glider.be>
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


