Return-Path: <linux-doc+bounces-30262-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 84E6B9C10A9
	for <lists+linux-doc@lfdr.de>; Thu,  7 Nov 2024 22:10:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 48B91282610
	for <lists+linux-doc@lfdr.de>; Thu,  7 Nov 2024 21:10:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E095821B426;
	Thu,  7 Nov 2024 21:03:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="OTFAjJ3m"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-yw1-f201.google.com (mail-yw1-f201.google.com [209.85.128.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5348021A719
	for <linux-doc@vger.kernel.org>; Thu,  7 Nov 2024 21:03:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731013424; cv=none; b=cTvGjtYxMKKVneyqzMm+NlRpUfOMI7s0JQkkX43lKSErbBG0sRY4pZC9CuvpbWg0H8qhzVHmT678UlBP4iwR+U0pw+gJCrIZpFRQ7MO24o5hjYtv7fQ+h6HbrF6h7gJCGaulGtEyxvGRMA+kF+cnYmOx4AHq40bdRqR4Nx1TcG0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731013424; c=relaxed/simple;
	bh=Ipz5bALsN/MIsblwdy7t5XX40kUUu8f2PO2Qy5od7Ls=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=E49L+maZNhxGWSso/L19gcNH0j6K7iSrTulJto1ieWpUegiglaDtmVf9HEWuRcwj8b+ppcUUuvTB0OYfPBUNLcTf9kFmpPuQ7Kk779x0oDx6blehEvAvs7J06TU/ST2/f90TYNymcUGRdWX6o2pDigcZT86CSuXFam4t2adT1pk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--almasrymina.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=OTFAjJ3m; arc=none smtp.client-ip=209.85.128.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--almasrymina.bounces.google.com
Received: by mail-yw1-f201.google.com with SMTP id 00721157ae682-6e376aa4586so27006117b3.1
        for <linux-doc@vger.kernel.org>; Thu, 07 Nov 2024 13:03:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1731013422; x=1731618222; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=bV4qNgv2ysT4G5mWwtsIUu7x27Hvq/nn+qp34bHS8cc=;
        b=OTFAjJ3mc8zZqNMq0icMmKl+VFQwL7prk0wQXn84TmVqiB1nS8OEpIBeY559JKIuBj
         5nR6zJqvRfgYxPyPrAyUTNJSWGLziVNdipwultzeR2r2vf99w3mW5Rwe8kqC/SRQ5YSB
         EB3NbYoojBi8S69fbS+wAXN5iOjUeex5wemFjcaiu9OnaGOaxvcSTtDkNOu/Suo1M1i3
         eKWnYHM0DGt89i8+E8+n7g6rnsAdTl3HuwWdawuoe+hH4BECj9/GQqHKLYSsvAYdZjfP
         NWw85XIysgp4c0e8CN5MLXu7grDrDqxNGYmFJmuTUqZWmhfrSiRqq8NTi3SnNnFKVR/j
         pEgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731013422; x=1731618222;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bV4qNgv2ysT4G5mWwtsIUu7x27Hvq/nn+qp34bHS8cc=;
        b=opX0S/U1AiM5KCgH1dCTPqvWSMmPHEhNXJEAKn2XXO+ihrVJctj6qD/79SMkmHS2pS
         BNs8kgZ60DmEtZi6qKUvERtip154yQkxdh0Oyz/iW09eeFeEKE9nrwAuGIKrxvxVmsQE
         t2ymw+Fn8NIAPdYqxZOMQvAAhPgo1mHLMNAKuEU9XwwaQVP898XntXqhXZChs/MPqsYU
         uz/5RTvVS/SD1RL5WrhXgGcEbLUDpg53lPtwfs04FyCCjJDoB2MfSqU5RqYAlIaFSK8Y
         M5KD7IHgEt8eBir696wnwaXrHEPpM0BObSI+uGfKwJd/RMeu2H2/Gu51y/i0ApDvQZ4f
         pPvA==
X-Forwarded-Encrypted: i=1; AJvYcCX6q8bMU/pKcYrh6UgLcHJhtqDkoq1qmLjtJjTmuRm8Bm4n3GoBNXH9ffISq0CLCHspB8QB4yDPj8c=@vger.kernel.org
X-Gm-Message-State: AOJu0YyqhKyrjuaRYe3y++kgFyFm5A9ZVar/7I6u90Pixsm+9P4r7Zzk
	nK2KMalaYLjF/QwG7gZmEL6mMqtVbIgOV/Oq/gwNMsnWwNeWpIUPWnbEkZ0BG4GI4CAXRJ6yfTh
	d6lZ6sr/6dVvRGEdf4oY6EA==
X-Google-Smtp-Source: AGHT+IETrU+0A00hHxfHIfVFgSG2d0BZXXwBrEStRbQNBitfarxBIyneJZkPxpSo9OfqjUnUZYEjH0Jc/5cpQqJbFg==
X-Received: from almasrymina.c.googlers.com ([fda3:e722:ac3:cc00:20:ed76:c0a8:4bc5])
 (user=almasrymina job=sendgmr) by 2002:a05:690c:610d:b0:6a9:3d52:79e9 with
 SMTP id 00721157ae682-6eaddf8de42mr8117b3.4.1731013422380; Thu, 07 Nov 2024
 13:03:42 -0800 (PST)
Date: Thu,  7 Nov 2024 21:03:31 +0000
In-Reply-To: <20241107210331.3044434-1-almasrymina@google.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20241107210331.3044434-1-almasrymina@google.com>
X-Mailer: git-send-email 2.47.0.277.g8800431eea-goog
Message-ID: <20241107210331.3044434-2-almasrymina@google.com>
Subject: [PATCH net v2 2/2] net: clarify SO_DEVMEM_DONTNEED behavior in documentation
From: Mina Almasry <almasrymina@google.com>
To: netdev@vger.kernel.org, Jakub Kicinski <kuba@kernel.org>, 
	Eric Dumazet <edumazet@google.com>, Willem de Bruijn <willemb@google.com>, 
	"David S. Miller" <davem@davemloft.net>, Mina Almasry <almasrymina@google.com>, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Cc: Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	Jonathan Corbet <corbet@lwn.net>, Yi Lai <yi1.lai@linux.intel.com>, 
	Stanislav Fomichev <sdf@fomichev.me>
Content-Type: text/plain; charset="UTF-8"

Document new behavior when the number of frags passed is too big.

Signed-off-by: Mina Almasry <almasrymina@google.com>
---
 Documentation/networking/devmem.rst | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/Documentation/networking/devmem.rst b/Documentation/networking/devmem.rst
index a55bf21f671c..d95363645331 100644
--- a/Documentation/networking/devmem.rst
+++ b/Documentation/networking/devmem.rst
@@ -225,6 +225,15 @@ The user must ensure the tokens are returned to the kernel in a timely manner.
 Failure to do so will exhaust the limited dmabuf that is bound to the RX queue
 and will lead to packet drops.
 
+The user must pass no more than 128 tokens, with no more than 1024 total frags
+among the token->token_count across all the tokens. If the user provides more
+than 1024 frags, the kernel will free up to 1024 frags and return early.
+
+The kernel returns the number of actual frags freed. The number of frags freed
+can be less than the tokens provided by the user in case of:
+
+(a) an internal kernel leak bug.
+(b) the user passed more than 1024 frags.
 
 Implementation & Caveats
 ========================
-- 
2.47.0.277.g8800431eea-goog


