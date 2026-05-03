Return-Path: <linux-doc+bounces-85521-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YLF2IoaY9mkgWwIAu9opvQ
	(envelope-from <linux-doc+bounces-85521-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Sun, 03 May 2026 02:36:22 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 11FC64B3DAD
	for <lists+linux-doc@lfdr.de>; Sun, 03 May 2026 02:36:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BF51C300CE5C
	for <lists+linux-doc@lfdr.de>; Sun,  3 May 2026 00:35:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 49ADA17A586;
	Sun,  3 May 2026 00:35:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=maestretorreblanca.com header.i=@maestretorreblanca.com header.b="r8tLsvEF"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-vk1-f180.google.com (mail-vk1-f180.google.com [209.85.221.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 051AD1A6814
	for <linux-doc@vger.kernel.org>; Sun,  3 May 2026 00:35:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777768550; cv=none; b=eTNBA+g59iNluVkNCBZqB+pQp+0pHmUzTvYQkVcasEB0esnWbKSatChM6KKgbr7ZGfyLjs6N8XcDVYXhH0xQnpPhl387aUxHnEWZbd+XSnQ5Np1brSbBna2fMSgdjHg50HT/V+B8U9uN77vVeGxM3tOo+VWSchp+reSqxjEtu8Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777768550; c=relaxed/simple;
	bh=Esy4gRgYGYyA78yvBpzvgwEGOm3rvfTloW2GniXjYOo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=qplSfcs+jARK6vJbp15/Vg6m7UN/+T7oYWJ0cZHU5S230l8e3OX74YutprLzFmV82srnAHda6vmEUaTwbDUaUByBVjJ5VlJuPFN8cNF16Teu+eYCdpEuuWOGoIPaoNaqPVZTsoKJ0obXKWIKBF7vLnW4F202cUWo+hk5ty2Pzn4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=maestretorreblanca.com; spf=pass smtp.mailfrom=maestretorreblanca.com; dkim=pass (2048-bit key) header.d=maestretorreblanca.com header.i=@maestretorreblanca.com header.b=r8tLsvEF; arc=none smtp.client-ip=209.85.221.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=maestretorreblanca.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=maestretorreblanca.com
Received: by mail-vk1-f180.google.com with SMTP id 71dfb90a1353d-56efdc96b05so1980542e0c.1
        for <linux-doc@vger.kernel.org>; Sat, 02 May 2026 17:35:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=maestretorreblanca.com; s=google; t=1777768548; x=1778373348; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=FsEMKzfoD4c133zpx8hGdf13q8ngaH5mIvb0VTrDGQ0=;
        b=r8tLsvEF+PYJyyzv/gQCUcnIirG9DuFYobACe7QApPdqT5zWBUB3aj/E39NdmTdZmZ
         Zo6vQqLuorzy317bzWfnbGqLd8TruBz78KJ9PM8GVxm+ckywM+F+l2zdbpZEeRn15yTP
         ahr7pu41yI7i+2J+4K2gsVR2K7jK8/M4HtnX2wV7RbZDtgo/1D/gln3jxdwnGSjJxF6r
         jj7lAqDmHP2TaYixIstNr+p5eYGoNucTRMfkAFWZwSUMH1JH2NuEsDDAKcvkGjrqd0xT
         pm3CF8OpjUQL0YDVnWqRPMzFtudRC+UwKdx3UGc3DcqEo+xoFZdTpK5xbMx3cCPQOSaV
         M6bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777768548; x=1778373348;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FsEMKzfoD4c133zpx8hGdf13q8ngaH5mIvb0VTrDGQ0=;
        b=Hzdy2+FcZt5Zl+j87filU4Qwh6Uygv0bgq31bo0rH9jQsgRonupUkblmxizBy0IyfV
         Y1e9/0c2e66yZilSSEaEiA/fBUKvBIXiA8DshHQzw/lk6BcmrIoWmdnUEX53X3cOr3iv
         zhe+Nj5km40vGTtbPnZsNydpOrdrhFkPXAdy5iINNMXO0pIzuSvWjYXqmVc9JxCFoIGy
         xyeTgiKhnCn5rwED6a61aRjpbJOye9xmrMN4VQsDzOgbEntdkiKdzbqlBTDJmURY+Wga
         0fjElHYYEKZRF8bxBN4HmJCiHW9xM0/1kOfkf7XGks+irq7Nwt3qI1ozdfgqFcvdybFL
         Ly6w==
X-Forwarded-Encrypted: i=1; AFNElJ8LgChSu1ABMbK8mR91ywgm+0qWwFP04dcPeURvKXaMnV9rYrvLXxnudORZDdgtoF3KsZJqgeOPcN8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyjpbi+eXaMnYeUiP/58MGBbG0nIjdKWG13ImJPvc1OX70rtDUM
	3hOXp0eTuYr9VXYEWXId1TxFUL+Ocyf1ymy0EGLcl1b+Tln3tRMrJyL1p4yW7ORjzFE=
X-Gm-Gg: AeBDievpRA6BfDDB1o15LTlBq3OCz5305BWlDwYJ5ydfl5B4yquS2jYx6Eb7zJpczVq
	J6yZdWWS2xLyZLYBOIlqiqvbvinPL5vjc0Y3wZlrYKObtg7m5Rd7+NiUHS03tJUfhDXIfkJus8Y
	E1w2pdoZ4tWG/WJpBulMhDz/W9X2wH/YqCLyfB38iRr56++qOEaVPyKpY4WzG2EVZCDl+Dlz1eR
	ZKZNeVmrgzE7jZvGoWHuMlgBgWXFEKYApqrtYxP9+nBltrQpxT7BWYtTifkn1SyHB1k7W2xAbFF
	LmBvSLuT/7ScbqlWRAr2ye9l7eWT5iNw7KNuIHhpJTJKESjMivNU4gru57YYcWR9iWP74jPV4Pe
	7bZNaFdI3xG04eVE95canaSLIgiASQ7HfpJ2aDzshEf3jzwaSqcYj1onMedzQVsq+6RHAZ4HoGg
	PgNR3PpmtTcpNdhVX8QeCZu6qrznNzxcikd2zxor4SFB7n7Zn5uEczckBmjc2bQNOmlXMxbHlNZ
	2XJ+wiE/e5qJESocWb9vvnkYK6KINxD43NcVg==
X-Received: by 2002:a05:6123:4202:20b0:575:22f2:a22 with SMTP id 71dfb90a1353d-57522f2184fmr73280e0c.10.1777768547972;
        Sat, 02 May 2026 17:35:47 -0700 (PDT)
Received: from localhost.localdomain ([95.214.114.12])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-574970ee582sm4201834e0c.0.2026.05.02.17.35.43
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 02 May 2026 17:35:46 -0700 (PDT)
From: Francisco Maestre <francisco@maestretorreblanca.com>
To: airlied@gmail.com,
	simona@ffwll.ch,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	corbet@lwn.net
Cc: dri-devel@lists.freedesktop.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Francisco Maestre <francisco@maestretorreblanca.com>
Subject: [PATCH 3/3] Documentation: gpu: todo: fix typo 'themsevles' -> 'themselves'
Date: Sat,  2 May 2026 19:35:41 -0500
Message-ID: <20260503003541.62584-1-francisco@maestretorreblanca.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 11FC64B3DAD
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[maestretorreblanca.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-85521-lists,linux-doc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,ffwll.ch,linux.intel.com,kernel.org,suse.de,lwn.net];
	FROM_HAS_DN(0.00)[];
	DMARC_NA(0.00)[maestretorreblanca.com: no valid DMARC record];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[maestretorreblanca.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FROM_NEQ_ENVFROM(0.00)[francisco@maestretorreblanca.com,linux-doc@vger.kernel.org];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[maestretorreblanca.com:email,maestretorreblanca.com:dkim,maestretorreblanca.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]

Fix a spelling mistake in the panel-simple/panel-edp TODO section.

Signed-off-by: Francisco Maestre <francisco@maestretorreblanca.com>
---
 Documentation/gpu/todo.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/gpu/todo.rst b/Documentation/gpu/todo.rst
index 520da44a04a6..e371134782f8 100644
--- a/Documentation/gpu/todo.rst
+++ b/Documentation/gpu/todo.rst
@@ -456,7 +456,7 @@ be turned into a WARN_ON() or somehow made louder.
 At the moment, we expect that we may still encounter the warnings in the
 drm_panel core when using panel-simple and panel-edp. Since those panel
 drivers are used with a lot of different DRM modeset drivers they still
-make an extra effort to disable/unprepare the panel themsevles at shutdown
+make an extra effort to disable/unprepare the panel themselves at shutdown
 time. Specifically we could still encounter those warnings if the panel
 driver gets shutdown() _before_ the DRM modeset driver and the DRM modeset
 driver properly calls drm_atomic_helper_shutdown() in its own shutdown()
-- 
2.50.1 (Apple Git-155)


