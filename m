Return-Path: <linux-doc+bounces-78271-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wIPbEvU/q2mdbgEAu9opvQ
	(envelope-from <linux-doc+bounces-78271-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Fri, 06 Mar 2026 21:58:29 +0100
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id BAD9B227A9A
	for <lists+linux-doc@lfdr.de>; Fri, 06 Mar 2026 21:58:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9A85B30490F7
	for <lists+linux-doc@lfdr.de>; Fri,  6 Mar 2026 20:58:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CEFA6481661;
	Fri,  6 Mar 2026 20:58:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JPVORuUR"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7247746AEC5
	for <linux-doc@vger.kernel.org>; Fri,  6 Mar 2026 20:58:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772830705; cv=none; b=op70gKBg/8lWFEebgQfe6sRkpT3mYkHVKQRDhiHzP/yLOO1h6h6AWdNAW2A8lZvUZBjz75sjDM19rG/nBdkTC04asdmmtWcU92+Ix5cWOvGmPt2R1Lb0j3a1QlEY0PhEW/o4are9RvJEFjHnLNp2gPf2W2Xj6vSjNjzSQgcjjhg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772830705; c=relaxed/simple;
	bh=Qkx2gSFDFTT+aES88PTKO/DLSriAtCDtrijXgu+5LoE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Ead8fa+2NNFT2OSvL3u0HOdqKlTqnUN+M+CzsJF3EDEyFtwmjx9NGkXURmTRSiAGLa71yML0/rn0qb5JzCM3Eaf3Dv+aLutfIbZ8qdl9AT2hav6kVHmb40bAPPfGLirSX0E5e5+TpmwE0RmSEXbTrZfPvkMiIt3aPYyclnDX7PQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JPVORuUR; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-661d20c9787so654716a12.0
        for <linux-doc@vger.kernel.org>; Fri, 06 Mar 2026 12:58:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772830703; x=1773435503; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=jwO02ZCPgD0VxK8Lt5yXmyrunUSd8TBuKbL6rr91DD0=;
        b=JPVORuURM6ROcXu3HMbyzqCU0fST3DBsKIhyFJ7sW6y0M4GKEi2wW6gXZI8VZfJ+1K
         qzp+gohYcqERuqpjLhNnvg94HRC9GeP0He/wjOJHlJviDctcuYJzGo9mcwMPFGlVwaWn
         s3ufgmkZ0he5uA3H2moAJnMdmSXjX7dkt+Ep7i58wWEqf+fkXK7o49guD5wE+IeppCsd
         owC8bPwoiELQ2yzRKBEROuxPReoG8sndYyjQ294KZ6dAWTSp+M8ISCQlGCpUi1aWZ9t6
         JZf66q+1UnjPESdFoEtPegjp0oUDMo2hutxoUTS8AvUDUJw80dO6Xh1Bk7TMG5rNuSZ6
         8MKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772830703; x=1773435503;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jwO02ZCPgD0VxK8Lt5yXmyrunUSd8TBuKbL6rr91DD0=;
        b=Cgz4pj+ES5WrBnyT5NEAeU3dKnPUE51FkZDaHOIiZ3fg1xRPTwP0BbSuwBR+K66GU7
         OaWHVCUqKWuM3KS3nPevkoSGFoK6AIoez1+o5zZIuhohUxGvcXtxvMwZkaUgdwCxkMoC
         Wz98BWoBfJM0pHEOY6WUX3rIq+vOgt9suW/VulxgH0mJe5oo3LzRUgVEdaz4PLlDqLcP
         8rdNrBPVlo7iSpUDVoJr0oO2eCASksRPwQhi/wMZxF7jyaVbXg67HOc+fx//7hV30Yo4
         XYMbndh6CCNynGxrfpPZyIFuYv9saup6mruz3PuB8lAgI66rJTjuAtBDq6r25FjQoNaX
         Ev9A==
X-Forwarded-Encrypted: i=1; AJvYcCUgAAHgSxzemsku1EdY6Z56Aq7jUKx5MMgHqf1U5rn/qKLh7qsMiaLNqjwBRypDOl/hatzWT4tIaL4=@vger.kernel.org
X-Gm-Message-State: AOJu0YzAnIAsgVQX+BhHTyZuM1g/HkGSJC4iKOoKqVEaofC0sbSFhuZ+
	UdwQ9389TrzQbJTXoO7egoQOGOEAz5v99EuDE1MZh7dYUu3Q46ZJO97jpALUDoO2mYI=
X-Gm-Gg: ATEYQzxVYs4FBPuHGuD43T+NMVGuqgSAKhbZ/EspPoBS6SizCf7lxhtLxxsTXM35JI5
	w4PAb2Z66wra7rAz9BLuieSz7x0mxNl4U+ihjsAZebbk+/Za59oMsVD9wkSgU+W3kFySFLPngZu
	TAMuVwy42JgOQMiPoOvPy03CD6gEIpby+GyeJys4Zb/M14o6i8dJ5eGSqMspQi5TOoOIp1lQY6a
	ecyropA3z8IXGDRu+dVD0L9Aqr1tx7qV9EFP/CMecML8Rc7J4NDddZZr3MkMNZIuqbi2yKEUJSF
	HE5Bf0gSwARlCXIiKeXn5L6mZW9OHrDZlsIXiCCRsmjVGzfVaUbcKzM0l6GVIRTK/UbOkfSbSKx
	HtnZeIR+wqiniv3luSxWmP9X/FuN2Dq6CHtkUFKdTWEWz2Z9CLE6XJtJ2kXiPkVr7LfEnoB+WES
	bnNwQiiAxGxBDdgTkSwTyA7eDC4yvZLpOdodo74tq+haJpC1r2r9qpzSXJUg4MjZI3+kzv2fJ1N
	gCJPnPzKVBZF5ZOFAzm4nq0zOso4mbu0GFgupNiVIe6sMo=
X-Received: by 2002:a17:907:3e10:b0:b8f:e424:ae56 with SMTP id a640c23a62f3a-b942e107988mr220848066b.44.1772830702548;
        Fri, 06 Mar 2026 12:58:22 -0800 (PST)
Received: from localhost.localdomain (84-24-131-219.cable.dynamic.v4.ziggo.nl. [84.24.131.219])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b942f18baadsm89155066b.67.2026.03.06.12.58.21
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 06 Mar 2026 12:58:21 -0800 (PST)
From: Mikael Rothig <mrrothig@gmail.com>
To: corbet@lwn.net
Cc: dri-devel@lists.freedesktop.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Mikael Rothig <mrrothig@gmail.com>
Subject: [PATCH v2] docs/gpu: fix spelling mistakes in todo.rst
Date: Fri,  6 Mar 2026 21:57:39 +0100
Message-ID: <20260306205754.65746-1-mrrothig@gmail.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: BAD9B227A9A
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[lists.freedesktop.org,vger.kernel.org,gmail.com];
	TAGGED_FROM(0.00)[bounces-78271-lists,linux-doc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mrrothig@gmail.com,linux-doc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-doc];
	NEURAL_HAM(-0.00)[-0.986];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Action: no action

Signed-off-by: Mikael Rothig <mrrothig@gmail.com>
---
 Documentation/gpu/todo.rst | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/Documentation/gpu/todo.rst b/Documentation/gpu/todo.rst
index 520da44a04a6..686a94bead07 100644
--- a/Documentation/gpu/todo.rst
+++ b/Documentation/gpu/todo.rst
@@ -269,7 +269,7 @@ Various hold-ups:
   valid formats for atomic drivers.
 
 - Many drivers subclass drm_framebuffer, we'd need a embedding compatible
-  version of the varios drm_gem_fb_create functions. Maybe called
+  version of the various drm_gem_fb_create functions. Maybe called
   drm_gem_fb_create/_with_dirty/_with_funcs as needed.
 
 Contact: Simona Vetter
@@ -294,7 +294,7 @@ everything after it has done the write-protect/mkwrite trickery:
 
       vma->vm_page_prot = pgprot_wrprotect(vma->vm_page_prot);
 
-- Set the mkwrite and fsync callbacks with similar implementions to the core
+- Set the mkwrite and fsync callbacks with similar implementations to the core
   fbdev defio stuff. These should all work on plain ptes, they don't actually
   require a struct page.  uff. These should all work on plain ptes, they don't
   actually require a struct page.
@@ -882,7 +882,7 @@ Querying errors from drm_syncobj
 ================================
 
 The drm_syncobj container can be used by driver independent code to signal
-complection of submission.
+completion of submission.
 
 One minor feature still missing is a generic DRM IOCTL to query the error
 status of binary and timeline drm_syncobj.
-- 
2.49.0


