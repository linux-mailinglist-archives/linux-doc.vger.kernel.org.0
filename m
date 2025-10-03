Return-Path: <linux-doc+bounces-62408-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C7D6BB7F54
	for <lists+linux-doc@lfdr.de>; Fri, 03 Oct 2025 21:11:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 115644A82C0
	for <lists+linux-doc@lfdr.de>; Fri,  3 Oct 2025 19:11:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CDA4D1EE7B7;
	Fri,  3 Oct 2025 19:11:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OXBoJdwy"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D07083BB44
	for <linux-doc@vger.kernel.org>; Fri,  3 Oct 2025 19:11:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759518701; cv=none; b=kijrMlTZVmSdaQm0XJC0xbkr4Q4Uo66i1f4blqOUfMSmyj22C7bKkq6X+TsVKsbR0v88j7IFqEsE04/bwlV/70N1EJmAP1n0YZbyriX295r+lBKS72bK/3BGtqNml4Htwe5fdb6e61QHz/ToQtMOqJNxi6yjXHuzASHkIXDRl7w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759518701; c=relaxed/simple;
	bh=qNhI4fozkv8fv/lAwki7sY08xD4XO8qRaqdADN66AB4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=KxgD8onQYdHd9HOfpYdE1XbOWkT/MY+O3iHwunlZUEGcp9XWitynVH9jhvFMCjKT4Hev2cWzwGaBOzHivuOzkyG6IVff/kl2aX/Giob6pRCzFujmGlQRARXeKdv5Wirjzts0/kpy0fIKBNdBR0+Dm+trSeKPZ6DkAYI7hKTyXMQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OXBoJdwy; arc=none smtp.client-ip=209.85.160.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f178.google.com with SMTP id d75a77b69052e-4db385e046dso25160761cf.0
        for <linux-doc@vger.kernel.org>; Fri, 03 Oct 2025 12:11:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759518698; x=1760123498; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ReEFQvzA0ptpzhP/wKLfBOmz+qA+6kGtcka0Y6onfCY=;
        b=OXBoJdwyDlWMdK1a961ECoFByUwiUT/KLBKxv0ZtjHNl79yVg3pD52MVgzYGrFxHDW
         Z6JM79wCZOVBQiJzeyW51aEd0/TYrZrL9knu0Zd/JJ0DQsyh8ERYoA8BQMqEC3BLG6X3
         OA0LQbfq8VZTJz+xHi0Hxeq5049qSesodGqe0MafVHnvLe92A/Jldt+t01REwOib16Iw
         gsk21g6aBUUfDYoHvxmvuoIqNbjb+JntzIxnSqY5noxz5V4wAJxrdoD4BmsHo7QOU0SH
         cNamGwofGdUAwLx+GIQsSSbi1d+/CLRVTWpOlMeiDZ7kpBnfyuz3nzMs/xrKAkhYLSsc
         hheA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759518698; x=1760123498;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ReEFQvzA0ptpzhP/wKLfBOmz+qA+6kGtcka0Y6onfCY=;
        b=JVWx/UKfMzJQsNufnPRIPVGmBgUnKXNpUtaEwML8GAjm1uL5N57MA8qvJAsmU3W129
         TGcotIOwYtbKyjTcfBSg0ZDh9d+iLzqRcQanywCoJoKyYqwe7GpjnNsAneXVlDBqU7ku
         ZKNRoN3Jh4wEzWnUkiMTTvV6/S07B61fQel2BhUyv01Eel1oG+zUxQ881PQACwaC3kJj
         9+WX6eIFHAUSS5MEapz2lGRuZMPAw9Dwwxcn5CYjTNdRVIGYvUPSTvTd46cUOZSLgQJG
         qw+CpA1rQ83oWCNLoXIHXo5MWvraRkFYzf/FaIwladZwqjWn+gwmJPxdmF3hD8Zx/9Lf
         3xhg==
X-Forwarded-Encrypted: i=1; AJvYcCXRb8x1D22byJaeg/WLqEzJ5psHSkD41n3DY42mhBBsVb5yu1Uu3o4VZA6cVmLBS2hjvTuYT4o3hJc=@vger.kernel.org
X-Gm-Message-State: AOJu0YxKCIT7t+XFX9PaexRG3FR4uHW4ELheRnysfrw21XAvvE3EOrST
	aTg2h6SBaeMDwtXCcRTX26oyF96FKg3jhO4U7t6s54VPi4ivfVGDo7rGHhpaGw==
X-Gm-Gg: ASbGncv1ISb7TKGH75SCPIgIn/vl3YjYCWALGLRfv2rbewrnpJ5RddtMHjjVnS9RyMH
	TD4hrhK0ewbIM1RpfDRGydEwW4y7L4YTzMulhBONgCPVCGzjcir5FiIkSDyPQ5J9Al9oY+/Uzds
	ls3TBqW9iLif06Uet35Th7thHbsRulyGKea6Bv9UHYj+0cwLn0mlCR/IuCmvpbxJG56Y8wz+jqD
	jAT4E+ibvXPLJGpy+U6GMLphGE3qFxIgxbM19j0ylDCkocFB4YhNiYjxCQMRxG9tJ8J7lZuYoma
	24Fprso8UCGQ7c2zvk1grBNe7oVUiIsocD5y0eG+Yv2GoRowmbP/4V2DmG6qmaR3GH1vuiVCIug
	krlkddzy4DrxK3qsfki3kXCl8sGIeCEAN01IzhXWEBkoYt3GSEJHFLRGCt3AZG/aQdGjGp/eLfj
	w/yrka/VO6LDU+b2XnjxkIfm0QxcWGPQkPZbFTDiBXDc/xkaj55t4hAOXFPi62wAXvgajquiap2
	j0=
X-Google-Smtp-Source: AGHT+IEpaRGWG0AE0nbyt0iFzIe6GNXbyGNAl6pbmFlWyLhGrIG6sAvUMUV/AAhdpb0nTbdnc1CI9g==
X-Received: by 2002:a05:622a:4d0e:b0:4dc:cb40:7078 with SMTP id d75a77b69052e-4e576a3c704mr59562151cf.19.1759518697529;
        Fri, 03 Oct 2025 12:11:37 -0700 (PDT)
Received: from fuse-fed34-svr.evoforge.org (ec2-52-70-167-183.compute-1.amazonaws.com. [52.70.167.183])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4e55c9e79f1sm44631881cf.28.2025.10.03.12.11.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Oct 2025 12:11:37 -0700 (PDT)
From: Stephen Smalley <stephen.smalley.work@gmail.com>
To: paul@paul-moore.com
Cc: linux-security-module@vger.kernel.org,
	selinux@vger.kernel.org,
	john.johansen@canonical.com,
	casey@schaufler-ca.com,
	serge@hallyn.com,
	corbet@lwn.net,
	jmorris@namei.org,
	linux-doc@vger.kernel.org,
	Stephen Smalley <stephen.smalley.work@gmail.com>
Subject: [PATCH v2] lsm,uapi: introduce LSM_ATTR_UNSHARE
Date: Fri,  3 Oct 2025 15:10:00 -0400
Message-ID: <20251003190959.3288-2-stephen.smalley.work@gmail.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This defines a new LSM_ATTR_UNSHARE attribute for the
lsm_set_self_attr(2) and lsm_get_self_attr(2) system calls. When
passed to lsm_set_self_attr(2), the LSM-specific namespace for the
specified LSM id is immediately unshared in a similar manner to the
unshare(2) system call for other Linux namespaces. When passed to
lsm_get_self_attr(2), ctx->ctx_len is set to 1 and ctx->ctx[0] is set
to a boolean (0 or 1) that indicates whether the LSM-specific
namespace for the specified LSM id has been unshared and not yet fully
initialized (e.g. no policy yet loaded).

Link: https://lore.kernel.org/selinux/CAHC9VhRGMmhxbajwQNfGFy+ZFF1uN=UEBjqQZQ4UBy7yds3eVQ@mail.gmail.com/

Signed-off-by: Stephen Smalley <stephen.smalley.work@gmail.com>
---
 Documentation/userspace-api/lsm.rst | 11 +++++++++++
 include/uapi/linux/lsm.h            |  1 +
 2 files changed, 12 insertions(+)

diff --git a/Documentation/userspace-api/lsm.rst b/Documentation/userspace-api/lsm.rst
index a76da373841b..1134629863cf 100644
--- a/Documentation/userspace-api/lsm.rst
+++ b/Documentation/userspace-api/lsm.rst
@@ -48,6 +48,17 @@ creating socket objects.
 The proc filesystem provides this value in ``/proc/self/attr/sockcreate``.
 This is supported by the SELinux security module.
 
+``LSM_ATTR_UNSHARE`` is used to unshare the LSM-specific namespace for
+the process.
+When passed to ``lsm_set_self_attr(2)``, the LSM-specific namespace
+for the specified LSM id is immediately unshared in a similar manner
+to the ``unshare(2)`` system call for other Linux namespaces. When
+passed to ``lsm_get_self_attr(2)``, ``ctx->ctx_len`` is set to ``1``
+and ``ctx->ctx[0]`` is set to a boolean (``0`` or ``1``) that
+indicates whether the LSM-specific namespace for the specified LSM id
+has been unshared and not yet fully initialized (e.g. no policy yet
+loaded).
+
 Kernel interface
 ================
 
diff --git a/include/uapi/linux/lsm.h b/include/uapi/linux/lsm.h
index 938593dfd5da..fb1b4a8aa639 100644
--- a/include/uapi/linux/lsm.h
+++ b/include/uapi/linux/lsm.h
@@ -83,6 +83,7 @@ struct lsm_ctx {
 #define LSM_ATTR_KEYCREATE	103
 #define LSM_ATTR_PREV		104
 #define LSM_ATTR_SOCKCREATE	105
+#define LSM_ATTR_UNSHARE	106
 
 /*
  * LSM_FLAG_XXX definitions identify special handling instructions
-- 
2.51.0


