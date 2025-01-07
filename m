Return-Path: <linux-doc+bounces-34145-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id CBCEEA03A0B
	for <lists+linux-doc@lfdr.de>; Tue,  7 Jan 2025 09:45:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7D2B6164431
	for <lists+linux-doc@lfdr.de>; Tue,  7 Jan 2025 08:45:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 336691DF73B;
	Tue,  7 Jan 2025 08:44:47 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from laurent.telenet-ops.be (laurent.telenet-ops.be [195.130.137.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1DBE1E2845
	for <linux-doc@vger.kernel.org>; Tue,  7 Jan 2025 08:44:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.130.137.89
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736239485; cv=none; b=c2Yj47/0Mh9VzZOdjG4J9CLzOSFzYw2sn10GI2Q1hiLtUkEeHv5G9R4eWoNW4izMaeZqgIQXsp31+A3Esv5omTiatvnpbBVmuTXpi5n+pFWEHUWZNtlshOM08A5nG/8y0YgBKkEZOIqL/4JMDIQ2jtAoJDV3YS+9jWCBS5QVX9Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736239485; c=relaxed/simple;
	bh=5P9iZOWC+nkrEWb3FOIQ8gioITybKsrDoTgdL1L/wyU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=pMVsJ5pJbV1lgL1yl3MF3ulCT1ZKRdGT24XQKwEu03VRWTIJLl9aNMODPpFQHaud92g25+O2oHmZ2fxGpR4AO2/6eMlaWt3xMv5eN4OwOwVQqYtVNOcDUqWtnfOHgEsmb2xFgOskDRC5E2QlR8wdJe8EMiGImBwFHOaVEh/fh2c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be; spf=none smtp.mailfrom=linux-m68k.org; arc=none smtp.client-ip=195.130.137.89
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed80:39d4:dc4e:b4ce:1377])
	by laurent.telenet-ops.be with cmsmtp
	id y8kZ2D00U3AZZFy018kZWv; Tue, 07 Jan 2025 09:44:35 +0100
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.97)
	(envelope-from <geert@linux-m68k.org>)
	id 1tV5CP-00000008Zi0-3z6C;
	Tue, 07 Jan 2025 09:44:33 +0100
Received: from geert by rox.of.borg with local (Exim 4.97)
	(envelope-from <geert@linux-m68k.org>)
	id 1tV5CT-00000004lQd-20pE;
	Tue, 07 Jan 2025 09:44:33 +0100
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Miklos Szeredi <miklos@szeredi.hu>,
	Amir Goldstein <amir73il@gmail.com>,
	Jonathan Corbet <corbet@lwn.net>
Cc: linux-unionfs@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] overlayfs.rst: Fix and improve grammar
Date: Tue,  7 Jan 2025 09:44:28 +0100
Message-ID: <cf07f705d63f04ebf7ba4ecafdc9ab6f63960e3d.1736239148.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

  - Correct "in a way the" to "in a way that",
  - Add a comma to improve readability.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 Documentation/filesystems/overlayfs.rst | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/Documentation/filesystems/overlayfs.rst b/Documentation/filesystems/overlayfs.rst
index 4c8387e1c88068fa..a93dddeae199491a 100644
--- a/Documentation/filesystems/overlayfs.rst
+++ b/Documentation/filesystems/overlayfs.rst
@@ -266,7 +266,7 @@ Non-directories
 Objects that are not directories (files, symlinks, device-special
 files etc.) are presented either from the upper or lower filesystem as
 appropriate.  When a file in the lower filesystem is accessed in a way
-the requires write-access, such as opening for write access, changing
+that requires write-access, such as opening for write access, changing
 some metadata etc., the file is first copied from the lower filesystem
 to the upper filesystem (copy_up).  Note that creating a hard-link
 also requires copy_up, though of course creation of a symlink does
@@ -549,8 +549,8 @@ Nesting overlayfs mounts
 
 It is possible to use a lower directory that is stored on an overlayfs
 mount. For regular files this does not need any special care. However, files
-that have overlayfs attributes, such as whiteouts or "overlay.*" xattrs will be
-interpreted by the underlying overlayfs mount and stripped out. In order to
+that have overlayfs attributes, such as whiteouts or "overlay.*" xattrs, will
+be interpreted by the underlying overlayfs mount and stripped out. In order to
 allow the second overlayfs mount to see the attributes they must be escaped.
 
 Overlayfs specific xattrs are escaped by using a special prefix of
-- 
2.43.0


