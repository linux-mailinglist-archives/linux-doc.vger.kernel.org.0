Return-Path: <linux-doc+bounces-85597-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aFsuCVKh92mQjwIAu9opvQ
	(envelope-from <linux-doc+bounces-85597-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Sun, 03 May 2026 21:26:10 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B65454B71F5
	for <lists+linux-doc@lfdr.de>; Sun, 03 May 2026 21:26:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id ABD9B3001FD5
	for <lists+linux-doc@lfdr.de>; Sun,  3 May 2026 19:26:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8EA9C3A4F34;
	Sun,  3 May 2026 19:26:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TpAhrsiN"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-qt1-f193.google.com (mail-qt1-f193.google.com [209.85.160.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF3DC34750D
	for <linux-doc@vger.kernel.org>; Sun,  3 May 2026 19:26:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.193
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777836367; cv=pass; b=YL5u3P1Xqqm8Ye6OoGcLJJ5xmSNlNLoUl+LsfGAyE1tQbQENMD2wY+r3GxbV8DbqK8vlKRB3m35RdFcXcfkfbEYSsDgTNrlq1HebKAFNF14LjGoUYJOUYxVkGCTy9euKfb3dw4pM2ikPX7Xxe03LrzzxexducZFhDRzS3qJYMMI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777836367; c=relaxed/simple;
	bh=XG8UmKg83pU3wa46ae11h8XQSd0IMy9ZOQoi4a221jo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iBJyc/qHcMaMXhpvNn7t6ad23iPBiY5IxFzf1r+f+T7XE0Vv7v+aLOMsawQ3FMkxCaCAebFzXt1VGhyoDp8ugKPvNNTVT3Bt9UFjxjzQfuWMjRizafJZJVtngWuGwaqcszv1ca2K0GM65DAG3P7xeVxNsqjSIqBFveOP5WG1eDs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TpAhrsiN; arc=pass smtp.client-ip=209.85.160.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f193.google.com with SMTP id d75a77b69052e-50e5bea4045so29176241cf.3
        for <linux-doc@vger.kernel.org>; Sun, 03 May 2026 12:26:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777836365; cv=none;
        d=google.com; s=arc-20240605;
        b=lItSSzLAjO+SJO1dnD+naXBb+hUPPNZVW2XfXRiaBNBGuVmMJaeu+LH/14Bu/wd9+H
         FY9ziE170nSKdw7v0bzqe003cYDubQoTmd8kdB4jqk/KiZGTbhSBAxPiH4xFyEMX5YI7
         RrscVz63SADIVACd1ekUNwGLq9yQosghebJ4kXx7wenxgHaC3H+K0hZwwhgDys04BpSM
         y4V0EKtGaEwyDEyBPTsRuVZOawr1dlxchUinQ/vDIUge7hPnfczaTgIHBNIVm0d0CZcW
         JJcdG/mwygw2wK2h2XdxH0Pgfa6Da3VRborIZS5tzQK/77ja8x01KoAyg0lCNmukhnNY
         6gZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=XG8UmKg83pU3wa46ae11h8XQSd0IMy9ZOQoi4a221jo=;
        fh=8C8TniJVVERSGPDSwgd7lpnXX6l+ZgRkEtOSQWP8gU8=;
        b=aFdq4oK7Y0vE4nKZF1KBc/zAR4d6DzUqFDnTS55L6Mad7dFbiDtzo5wq29xv6NO+E1
         16aQ8ms9rV8e2jyAuereWAGZVC3zZLQ/dSOrRveGJQ412TQ6T9S4Mg1rjx2XL6bi8Kcj
         A+8JcZsmEuXeDCARwFY5nTWCMp6KAuv2sd/L7outwOY/Z9er1esYqEOPqWa5S6+E7cWV
         cPGR1UMx9joRfvpnUe/MUB8DpmnPJG3UGchK8q6T7K+DP6ohMVWKmJHw5QwHzZ4DXPIB
         z8zacGDZLHDEsAM3OW7qmJkMbdIbjR+NL/9qrvDaQuhb0WsYbKpMQEtThItCZxsPJn2y
         ju2g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777836365; x=1778441165; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XG8UmKg83pU3wa46ae11h8XQSd0IMy9ZOQoi4a221jo=;
        b=TpAhrsiN1w4MuUK/KvhoDfwpfknywP/TchZIP7VXEZlnXDUtXU2XHf3VVLtqVTdpHa
         60XqD8a0azjGaFiM5UunFpakszAQM+DNoShaQgLHdnVadbULFDu2vwbw7SASACzD19y5
         Wj47b+C9UDD+jLni9eCF0iLIXMbCHZSwK875B71D385SJqAV12dHooJzlwyv+xhqH+3J
         5byLzcj0LJ+3ygOtXEVCCwv5qoIT2a8A7x/VQwtY9YUvt9S0ge5pNxwARlWGRBKUBZ8Z
         mW0JkKuW5rAkAJx1O60fg8j0atdcwf5IHh9jW/omh1JkHBVt4Inx70wUn6b5m6HuXisE
         uUbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777836365; x=1778441165;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=XG8UmKg83pU3wa46ae11h8XQSd0IMy9ZOQoi4a221jo=;
        b=VLSkmrd2CIAWfghYd927LjjKzcnodq8aHJf6f+5AkA3UOPFlEhwCZf2XEzEDeY8I8l
         y1r0KA+vTpwoH2OC/XjxHZTBuXIJPoyM+09hYJcXwzBmAjpaucRzIuvUzYYGkyBjrL0B
         jvwwtS9KCY8I1dhc6mWBjj1zfQSHDJS4g+hNUn/6h5mm3cMRCl3CM19Uc0QvkzeQOLrA
         G7AO4l+IIDRmBIcpi/2zUFM1drTR7U2yMZyjznUJ1Egd4Eu3k89d6YwLrYcXp5KzuObi
         T+Auy3Wz9uP0KBP0zdbS7cBN/aIcyQrqby7pnh2mSQ+QR3DpxaXcBhkTCd4r/LUeh/x9
         dzsw==
X-Forwarded-Encrypted: i=1; AFNElJ95Sr3U3E//wtlMeTXDI7GHaQolA0ErhPdU/hac6OHurXrYdhGIHEDplUyIa6Yf7HOkw0M11c8nXqI=@vger.kernel.org
X-Gm-Message-State: AOJu0YwelGWoW4CAee8MeDRTy7PfQnAfY78JKKER2RoNakbXP5NgkxxG
	eWKGrftu7K1USiPJl6EIRVDM7BsBi2YW4KFxNUc96BNzwrsYa2KcQjZti03YAAbwTC3FM1Q8ybU
	Y5f3Qrve40iFzvobGplVCm9+NQAEuty8=
X-Gm-Gg: AeBDieueCowrsFy//QDmyfQtsSg/N4xdygmA63NhP+uO6mb13lR0GcUNwGe83TDJ8x+
	s4mPuZ/TWQhxVzRzXrHq+y9E+OB2dxSH3HR5rIgCiqRJAP6GZxHZQNKMpptA7q9tMk7qJoqPYqb
	IYrvdXRjodC/gQyWIa1QF+AmYoJbjcwRxrwEpt6D68l/M9w4ZFrxVIppjHb9KWIjmiH3or5FpXA
	BcaqzubieozbaJ4HCbjrLyRxQ3QC6X0NHZy94CBNDcsGzJS3I3D3mUFP1zvcqO0rX6C+Pc83rMS
	SjXFcSjfsHelWBD1xBG+GAvTL+nbd2t9qm7k7wGqPmWGPKJ8e/6peJKNUzEw8QV4H8tXg1iHkQ+
	ThNAZ
X-Received: by 2002:a05:622a:30a:b0:50e:5fe2:83aa with SMTP id
 d75a77b69052e-5104bdf1496mr111994061cf.12.1777836364623; Sun, 03 May 2026
 12:26:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260503030801.14080-1-enelsonmoore@gmail.com>
 <2026050340-kilogram-prissy-a833@gregkh> <CADkSEUgPtjkKC684O3qB=koKDPwJoUj-qU_4Z_18NAU_+bBqkw@mail.gmail.com>
 <e12da6e2-5e50-4819-a5a8-2bc675da4c14@lunn.ch>
In-Reply-To: <e12da6e2-5e50-4819-a5a8-2bc675da4c14@lunn.ch>
From: Ethan Nelson-Moore <enelsonmoore@gmail.com>
Date: Sun, 3 May 2026 12:25:53 -0700
X-Gm-Features: AVHnY4Kt5s_1C8ObOd9tow1DeOBNsioFkEIF5beY5wz6dDacfl0-oSTa2HpU6_E
Message-ID: <CADkSEUiusP8WjOAPTZjAexu1hMukWugXow45hzvfFOYvO2bg9A@mail.gmail.com>
Subject: Re: [PATCH v2] tty: synclink_gt: remove broken driver
To: Andrew Lunn <andrew@lunn.ch>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-doc@vger.kernel.org, 
	netdev@vger.kernel.org, linux-serial@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
	Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Jiri Slaby <jirislaby@kernel.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Bagas Sanjaya <bagasdotme@gmail.com>, 
	Haren Myneni <haren@linux.ibm.com>, Eric Biggers <ebiggers@kernel.org>, 
	Qingfang Deng <qingfang.deng@linux.dev>, Julian Braha <julianbraha@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: B65454B71F5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-85597-lists,linux-doc=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[32];
	FREEMAIL_CC(0.00)[linuxfoundation.org,vger.kernel.org,lwn.net,linux.ibm.com,ellerman.id.au,gmail.com,kernel.org,lunn.ch,davemloft.net,google.com,redhat.com,garyguo.net,protonmail.com,umich.edu,linux.dev];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[enelsonmoore@gmail.com,linux-doc@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-doc,netdev];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,mail.gmail.com:mid,lunn.ch:email]

Hi, Andrew,

On Sun, May 3, 2026 at 7:23=E2=80=AFAM Andrew Lunn <andrew@lunn.ch> wrote:
> Sounds like a whack a mole problem. I assume the recent removal of ATM
> broke it as well? Maybe __has_include() could be used?
That's a great idea. I will investigate that.

Ethan

