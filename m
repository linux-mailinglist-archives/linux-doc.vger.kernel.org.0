Return-Path: <linux-doc+bounces-86545-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cOBEOCsu/mmengAAu9opvQ
	(envelope-from <linux-doc+bounces-86545-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Fri, 08 May 2026 20:40:43 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A3E44FAAF3
	for <lists+linux-doc@lfdr.de>; Fri, 08 May 2026 20:40:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DAF623030EB5
	for <lists+linux-doc@lfdr.de>; Fri,  8 May 2026 18:40:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B35053DA5CF;
	Fri,  8 May 2026 18:40:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dKoI9bOP"
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 906C23D566C
	for <linux-doc@vger.kernel.org>; Fri,  8 May 2026 18:40:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778265624; cv=none; b=vFCqMzBRf0KV1953JPNqZ5uF8PCML/NP3aX/UUMqiJeyriQlaeOTFy3EvRAOJb4vwbaFxByaWlSW7sN8DUdXYacUcRWT/S1VhmfDqUmpYdCEhPmH/IQLvZjWA88yTRoRfKpvTLLmsV9CIi5mWD3NnzGc1Fsk5z3Bu46Ph5xNH0k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778265624; c=relaxed/simple;
	bh=qz93F/HxdriwHEV/MIqKAkXcmepTE7EdTknHdMsdiAE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ocorY7FjGBzxHJ0LiZ2MB0zA7opvkPFXMkk0RtmBDJO/11vfRrGXABTNly9uwEuQK/JLWoJYaQGY98n8BT3t5mP26HxsVB4yych0qydynJwyVYElDL9fDJrVC0hGoav75M4ylQs7WtrpumnGwN/OWxMxNN7u63iXbcge2IYBMn4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dKoI9bOP; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 56715C2BCFC
	for <linux-doc@vger.kernel.org>; Fri,  8 May 2026 18:40:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778265624;
	bh=qz93F/HxdriwHEV/MIqKAkXcmepTE7EdTknHdMsdiAE=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=dKoI9bOPWxgxC0+6yp6R0geAeeqpKPRqTDg2g3dM4Nnia09m1ZhLRUM1ZviTiUiDo
	 XTiHqaZdmnpeDECBG7pvN7RuixmxJroanOwYH6POhWWt0PyzCb/7Si/gZYLZTwj50x
	 Vkp/BHPtrXYv82BhUZZiLlRC40wUTOBkLL1CPClE5f8FU6tf4fpfC3cU1tRkVqoCH+
	 m+oGDneRZCZw3PA6hbPxgiNMikcedLr+Db+DFn2UTQb8f7yz4XiGiRNh4FJM9+B6VF
	 yMUdLCUzcw8P4Cxr+Lc7tEu6RerjTndLCUtvd616xap2bTab2FA/Fnqq1n9jSfV6kC
	 +Oe3jHiWfVktA==
Received: by mail-dl1-f51.google.com with SMTP id a92af1059eb24-1329507c387so566492c88.1
        for <linux-doc@vger.kernel.org>; Fri, 08 May 2026 11:40:24 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ9Omzv+0tphrE+uPB674SOywoI3W5PO64sf6LhxvGTnFQGIl+oBI82VabFnPzZueR3wXFXr7I2Tp7o=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxy+4vUFuOCwfsIL7r8rH9MwXh3eZxQlD/fTaq7MDLQ9FQkzCnu
	us7aHcsHL9RZCHMVwIDWrLklrj7LMdbWbUKODdHs6qGI+2hAPS6zDeg5505JD8bagTLkb/dCXpv
	CKUUrWk3Bt0lYnz4uEOQ5qxwhB2boEtA=
X-Received: by 2002:a05:7022:4184:b0:12d:b7bb:4f54 with SMTP id
 a92af1059eb24-131965af1a2mr8712853c88.3.1778265623772; Fri, 08 May 2026
 11:40:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260507191416.2984054-1-bboscaccy@linux.microsoft.com> <20260507191416.2984054-11-bboscaccy@linux.microsoft.com>
In-Reply-To: <20260507191416.2984054-11-bboscaccy@linux.microsoft.com>
From: Fan Wu <wufan@kernel.org>
Date: Fri, 8 May 2026 11:40:12 -0700
X-Gmail-Original-Message-ID: <CAKtyLkHjxanzN5MZsMP520CytqjqhZBgC=P=USAZZf9-4Z5zjw@mail.gmail.com>
X-Gm-Features: AVHnY4L0ricLjqitH1mYLaoPM_3aJ0znexaW7kxQTHh_lR1Ix2wR_9tibB86JxM
Message-ID: <CAKtyLkHjxanzN5MZsMP520CytqjqhZBgC=P=USAZZf9-4Z5zjw@mail.gmail.com>
Subject: Re: [PATCH v7 10/10] ipe: Add BPF program load policy enforcement via
 Hornet integration
To: Blaise Boscaccy <bboscaccy@linux.microsoft.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Paul Moore <paul@paul-moore.com>, 
	James Morris <jmorris@namei.org>, "Serge E. Hallyn" <serge@hallyn.com>, 
	=?UTF-8?B?TWlja2HDq2wgU2FsYcO8bg==?= <mic@digikod.net>, 
	=?UTF-8?Q?G=C3=BCnther_Noack?= <gnoack@google.com>, 
	"Dr. David Alan Gilbert" <linux@treblig.org>, Andrew Morton <akpm@linux-foundation.org>, 
	James.Bottomley@hansenpartnership.com, dhowells@redhat.com, 
	Fan Wu <wufan@kernel.org>, Ryan Foster <foster.ryan.r@gmail.com>, 
	Randy Dunlap <rdunlap@infradead.org>, linux-security-module@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, bpf@vger.kernel.org, 
	Song Liu <song@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: 8A3E44FAAF3
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-86545-lists,linux-doc=lfdr.de];
	FREEMAIL_CC(0.00)[lwn.net,paul-moore.com,namei.org,hallyn.com,digikod.net,google.com,treblig.org,linux-foundation.org,hansenpartnership.com,redhat.com,kernel.org,gmail.com,infradead.org,vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wufan@kernel.org,linux-doc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Action: no action

On Thu, May 7, 2026 at 12:15=E2=80=AFPM Blaise Boscaccy
<bboscaccy@linux.microsoft.com> wrote:
>
> Add support for the bpf_prog_load_post_integrity LSM hook, enabling IPE
> to make policy decisions about BPF program loading based on integrity
> verdicts provided by the Hornet LSM.
>
> New policy operation:
>   op=3DBPF_PROG_LOAD - Matches BPF program load events
>
> New policy properties:
>   bpf_signature=3DNONE      - No Verdict
>   bpf_signature=3DOK        - Program signature and map hashes verified
>   bpf_signature=3DUNSIGNED  - No signature provided
>   bpf_signature=3DPARTIALSIG - Signature OK but no map hash data
>   bpf_signature=3DUNKNOWNKEY - The keyring requested by the user is inval=
id
>   bpf_signature=3DUNEXPECTED - An unexpected hash value was encountered
>   bpf_signature=3DFAULT      - System error during verification
>   bpf_signature=3DBADSIG    - Signature or map hash verification failed
>   bpf_keyring=3DBUILTIN     - Program was signed using a builtin keyring
>   bpf_keyring=3DSECONDARY   - Program was signed using the secondary keyr=
ing
>   bpf_keyring=3DPLATFORM    - Program was signed using the platform keyri=
ng
>   bpf_kernel=3DTRUE         - Program originated from kernelspace
>   bpf_kernel=3DFALSE        - Program originated from userspace
>
> These properties map directly to the lsm_integrity_verdict enum values
> provided by the Hornet LSM through security_bpf_prog_load_post_integrity.
>
> The feature is gated on CONFIG_IPE_PROP_BPF_SIGNATURE which depends on
> CONFIG_SECURITY_HORNET.
>
> Signed-off-by: Blaise Boscaccy <bboscaccy@linux.microsoft.com>

Acked-by: Fan Wu <wufan@kernel.org>

