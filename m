Return-Path: <linux-doc+bounces-90627-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id ZZzAG/mfH2qhoAAAu9opvQ
	(envelope-from <linux-doc+bounces-90627-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Wed, 03 Jun 2026 05:31:05 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id EF51B633ED7
	for <lists+linux-doc@lfdr.de>; Wed, 03 Jun 2026 05:31:04 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=soleen.com header.s=google header.b=aeqRda+x;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-90627-lists+linux-doc=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-doc+bounces-90627-lists+linux-doc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=soleen.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id DE47A30AE483
	for <lists+linux-doc@lfdr.de>; Wed,  3 Jun 2026 03:29:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F10BA3F39D4;
	Wed,  3 Jun 2026 03:29:10 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com [209.85.219.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B836A3F20E5
	for <linux-doc@vger.kernel.org>; Wed,  3 Jun 2026 03:29:09 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780457350; cv=none; b=QLdTUXs/7x0vGirBYmxbfxfSKKqq+KwCDYU+Oz7OetOLvwkKva7/gveYOld2JLGvpQTLw8/NiC732u+DsCWP5oCkYpndu8K7TGeYCyXU/3lqwz8nfxRvcFx6se1NLYaP4K4eB1GIjHztjc6t3lomMDhnn0p/8rmbegHmivhZ4vo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780457350; c=relaxed/simple;
	bh=IMbuGTukyT8IG40YTi+316UrswHf2CnDFbSS3RnRmnE=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CjifWGtoLGwcrPeqhZmtK5fOwnC2Wz3xrekJtWbgmQMvPCrzpZz/p0ik8+XfF4QUhELUxAO49qVPVXsx4Oe7xVDfd95/AmC/5JmTHO9T/lyXu2lof2R2t4F5yDfuAVX1YmL1Gb+L+LgLaQoQq0GU8B9O2msnPeUxNn2yuiK9g78=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com; spf=pass smtp.mailfrom=soleen.com; dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b=aeqRda+x; arc=none smtp.client-ip=209.85.219.44
Received: by mail-qv1-f44.google.com with SMTP id 6a1803df08f44-8ccef25789fso31532496d6.3
        for <linux-doc@vger.kernel.org>; Tue, 02 Jun 2026 20:29:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1780457349; x=1781062149; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yVlCXZe8SHDSOJUkKVBaYBikNvs5G4Pkl6SfmcOaAr0=;
        b=aeqRda+xv4SFXFn/xsc3EzBdNw8mmBt2KNugRtDIQflCA3NfN6cJoSd51j63O08nnI
         0i3ULCo3bA8uNOFTRi03T4lkEQqhxTwbF16EDxYrD7t5tDlmsvtxbG/aKS9l6Jkp92KM
         4J1J3hQqu9QtJvybdFfTWzc+1fcwjflbb2EZUxmmsoN5VnREeH7/H0yTHhF+hiei7zj5
         CwSTbhjiN4MkXkAhL/AcoS68VdWsW3QfFknDJ1f7Kzs2dlSiFVDEX9oJ/5WDGa9A6I47
         wHk5xNIw63gCWOzXzQOJdnumJbAdC75p1cvVW6oYYyWd/gtNQfkejp7x9FOv4nnk4Cf6
         3LSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780457349; x=1781062149;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=yVlCXZe8SHDSOJUkKVBaYBikNvs5G4Pkl6SfmcOaAr0=;
        b=lvLW0q0HfGN5Ey8ZAY8f0+PpDgKsY4AmQuipP3MLcGixH+QMKbavfYxrjnDWTHTYG4
         dSFclFaz+cWFNYipVgqqPkfvrMqcCqV+hhctwZIF7Q/GGOeIt0beWTdBgZaNOobksk0l
         aeACh+cwgsmbyQZYtmSYqun2pdI1qd4sK/uhFYtPKZY03x4VfxW9xeVJgaYgJmE11lLY
         MDJLiXW8ozgGRw/O91zniRJbMeQ4ucd2SY5a3U+76Xzvg+20KnP8XoJZrgBDeFXLnzdY
         pofkH9AYurVSeYjRb0M2pHS9bjml7QwRQJPiauYoJAvu85WXy+uXv4Qyio88G8X4sU9S
         rMAw==
X-Forwarded-Encrypted: i=1; AFNElJ/wDpacHD4g3eeMYJCMmOr3Q4AmUEeUP3YIDU89NPc1vNgw8nBsnJ9DhSqR9ce+cjUPnyRm5BXCG5o=@vger.kernel.org
X-Gm-Message-State: AOJu0YyOxRztCe4cCZqcnvNzkNBI0WtVrmHg4r/BwOuVlKxz2kwdYuHR
	fmjLyxkIIw+sRHUpKCaARe0VKuzl7MRHV3ZJIdQAoFuz23JX9GcSeZuetaspr1KN3LA=
X-Gm-Gg: Acq92OHIH3LirhTGD6MfBEK9OVXmUn8Y5kPkmRzYtzYnCwK/P3++QrcX0KSCwxC0sm5
	h+v1uLZjQGzdgacFKmNSlFckyN2Y+pQncA99lc7f/RkGjtnJ3j5xQym4voQFAQViJwQJsbgEJFL
	elCqhGAmn5vmmYUW/+4RPrc33RpfSoIbrydXC5o/SXYHYWg1xeNDVz8zR8u0uRcbBZmhsqBo9vR
	o++hAwaXrTXGjg6OMo8gj1lIhhEbQpGx6Ueqkv4FbeQ9NfXCrf508oBYiTYrzpP9KMJO254lzTX
	NXBSL4I3ZtFHBRVjl6O63LkS2+7XO1q89P+CvU6fpqlnXUU5nqD7OHO9xcdV9vXVLnAUDNBaR/3
	DYUibod7dB5wIySWUwE00F7XYaj39ojMYe/hiDS4XNUS75ejHbQT0p3VPTIvJ240xJXNkRbMbwg
	35Ti85okk9LHnh65riNDB0KYwZ/atBg/NYbOiu0wX7NEfYwlYWPcBvGZ3bWZEP/g==
X-Received: by 2002:a0c:f09c:0:b0:8cc:dfa6:3333 with SMTP id 6a1803df08f44-8cece028a1amr19783726d6.32.1780457348680;
        Tue, 02 Jun 2026 20:29:08 -0700 (PDT)
Received: from plex ([71.181.43.54])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8cecd26b3b9sm9244566d6.45.2026.06.02.20.29.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jun 2026 20:29:08 -0700 (PDT)
From: Pasha Tatashin <pasha.tatashin@soleen.com>
To: linux-kselftest@vger.kernel.org,
	rppt@kernel.org,
	shuah@kernel.org,
	akpm@linux-foundation.org,
	linux-mm@kvack.org,
	skhan@linuxfoundation.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	corbet@lwn.net,
	pasha.tatashin@soleen.com,
	dmatlack@google.com,
	kexec@lists.infradead.org,
	pratyush@kernel.org,
	skhawaja@google.com,
	graf@amazon.com
Subject: [PATCH v6 01/13] liveupdate: change file_set->count type to u64 for type safety
Date: Wed,  3 Jun 2026 03:28:52 +0000
Message-ID: <20260603032905.344462-2-pasha.tatashin@soleen.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260603032905.344462-1-pasha.tatashin@soleen.com>
References: <20260603032905.344462-1-pasha.tatashin@soleen.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[soleen.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[soleen.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	TAGGED_FROM(0.00)[bounces-90627-lists,linux-doc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:linux-kselftest@vger.kernel.org,m:rppt@kernel.org,m:shuah@kernel.org,m:akpm@linux-foundation.org,m:linux-mm@kvack.org,m:skhan@linuxfoundation.org,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:corbet@lwn.net,m:pasha.tatashin@soleen.com,m:dmatlack@google.com,m:kexec@lists.infradead.org,m:pratyush@kernel.org,m:skhawaja@google.com,m:graf@amazon.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[pasha.tatashin@soleen.com,linux-doc@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_NEQ_ENVFROM(0.00)[pasha.tatashin@soleen.com,linux-doc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TO_DN_NONE(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	DKIM_TRACE(0.00)[soleen.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCPT_COUNT_TWELVE(0.00)[15];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,soleen.com:mid,soleen.com:dkim,soleen.com:from_mime,soleen.com:email,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: EF51B633ED7

This improves type safety and aligns the in-memory file_set->count with
the serialized count type. It avoids potential truncation or sign
conversion mismatch issues.

Reviewed-by: Pratyush Yadav (Google) <pratyush@kernel.org>
Acked-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
Signed-off-by: Pasha Tatashin <pasha.tatashin@soleen.com>
---
 kernel/liveupdate/luo_internal.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/kernel/liveupdate/luo_internal.h b/kernel/liveupdate/luo_internal.h
index dd53d4a7277e..ae58206f14ac 100644
--- a/kernel/liveupdate/luo_internal.h
+++ b/kernel/liveupdate/luo_internal.h
@@ -52,7 +52,7 @@ static inline int luo_ucmd_respond(struct luo_ucmd *ucmd,
 struct luo_file_set {
 	struct list_head files_list;
 	struct luo_file_ser *files;
-	long count;
+	u64 count;
 };
 
 /**
-- 
2.53.0


