Return-Path: <linux-doc+bounces-91713-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id O14eGx5DKGr/BAMAu9opvQ
	(envelope-from <linux-doc+bounces-91713-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Tue, 09 Jun 2026 18:45:18 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id C1BD36628B0
	for <lists+linux-doc@lfdr.de>; Tue, 09 Jun 2026 18:45:17 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=google.com header.s=20251104 header.b=aLL5ixZt;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-91713-lists+linux-doc=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-doc+bounces-91713-lists+linux-doc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=google.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id A0BF130CA715
	for <lists+linux-doc@lfdr.de>; Tue,  9 Jun 2026 16:33:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B39614A2E24;
	Tue,  9 Jun 2026 16:31:51 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-pl1-f201.google.com (mail-pl1-f201.google.com [209.85.214.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 838FA4A340F
	for <linux-doc@vger.kernel.org>; Tue,  9 Jun 2026 16:31:50 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781022711; cv=none; b=itgGgOR0c8DAOWBW9vNSfVwSyOcTElMXLaFqLgrenskOtudzrIl6rw+keHnYY424nPM5r24S/RyThZVct2OZe0n+ccujCIO59SmT75sh2fbYAfs+9b6+k42Hb7CmtVXqKdVnpG+NPxSJqN6K4NKVaM2uHdRsJLfHZa0aRbxWM4Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781022711; c=relaxed/simple;
	bh=O27sB/RmwD8YNtwCKvnPaA0JgOPXO4OvaUEYOLLtvOM=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=iKlLM1pqKZ8PE4Dspx6cs2+pCvD2d1vgMwb+QbENZi7Fa9/rT8KjPBBmAWSnsO6dzpXTcS2vQSwG2MFgSs6BosHY3UFJKiRntBF/SGDVPQTKtAQOxo90Q7zNrtLZBAUBek6j13fldEkVMyZXtaR1W2fAAseiE9zey46BgvhU7T4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=aLL5ixZt; arc=none smtp.client-ip=209.85.214.201
Received: by mail-pl1-f201.google.com with SMTP id d9443c01a7336-2c0c1e08848so78563895ad.0
        for <linux-doc@vger.kernel.org>; Tue, 09 Jun 2026 09:31:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1781022710; x=1781627510; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Y+25TWd2l8G/N6ggT97DlYSDMeVMta32S9PytI7couQ=;
        b=aLL5ixZtjTtisXi4tNTjuYmGXvoGBQeqoPee4Ibs5Wk6kTTDm273wwpAAFZziBQ41N
         zCYDofGf1OLuqanbJf/9um3EHvTOttyhSXETSXPfODW2ZjNA9LJ5kXA3wgtykEbIpWoN
         hwcZreEJKgNeim+I5mkTGWPiyfq4sHmxHu3cWbYTfM3Qu+7Jb2ErnSCnblCXYQRNzo+N
         kKNoeoWhemTyyepe7+s5qx7JuuKlDXEHROq3r0XeJkvp1my/zvemtHzDS0gr3P4/UoXY
         8z3W1gTifTTfGozfIKOPifIm+b/818uDkGW4xtHaQTIn0cO1E9BlftwCNC1/M7YFuHx1
         XyXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781022710; x=1781627510;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Y+25TWd2l8G/N6ggT97DlYSDMeVMta32S9PytI7couQ=;
        b=YiivP8HS3erAjtx/XV8uvPMRdW2M7kZBYZS5VKn98ZqAs5SinhPI1gpE/OzESH/cMx
         APG7x4/oS25oytuxnuZ0yumJQj2WVD/L7fBISf5Kj5E9kzsMTKF+Bj/Qgaps3885V4i6
         YVIblTuAPE8vy7uCe8UttjqKCwhwaIhVxhRunJEsSwnQVlQ4W83X1TZCl1Fxs4mDOv0P
         mjYyXHZH4Ja+0K8sIpTyNuNdwchFNhBxlIr2GaKAhehL+NXxqwclHteSHr9ZuqFcIJne
         KUvSpQYBwOOMj6eDSMOn+3CE8prydIAqJE2OvZ9Zn0QBY1gf5Vpi/pJbK2KhvYr2qiN5
         5FJQ==
X-Forwarded-Encrypted: i=1; AFNElJ9LKna3uVV4CAhCXA5iD1rFdQbNfhY37APVoysWdAAWTTrdh6QtJPWYgGdXAD7ZPg0Ljjm2pF7a46I=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz27IoSerMMffIhrAj1+mTfBVGshvlxVd//Z7qLLswDx5I0iFXG
	fcxHq4VT7N6jMauW5Hvi+0bLG2WpMEt+fMAdWrnMSqAhKtaGKR9gLsBpangdkt5943EdRrolNXX
	yy8srpQ==
X-Received: from pfnv24.prod.google.com ([2002:aa7:8518:0:b0:842:4162:a47c])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:3d07:b0:841:dcbf:e82b
 with SMTP id d2e1a72fcca58-8430a66e82fmr4540257b3a.12.1781022709581; Tue, 09
 Jun 2026 09:31:49 -0700 (PDT)
Date: Tue,  9 Jun 2026 09:31:30 -0700
In-Reply-To: <20260603114504.814647-2-clopez@suse.de>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260603114504.814647-2-clopez@suse.de>
X-Mailer: git-send-email 2.54.0.1099.g489fc7bff1-goog
Message-ID: <178102228042.2735004.16823159723918988940.b4-ty@google.com>
Subject: Re: [PATCH] Documentation: KVM: Synchronize x86 VM types
From: Sean Christopherson <seanjc@google.com>
To: Sean Christopherson <seanjc@google.com>, kvm@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	"=?UTF-8?q?Carlos=20L=C3=B3pez?=" <clopez@suse.de>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Ashish Kalra <ashish.kalra@amd.com>, 
	Michael Roth <michael.roth@amd.com>, Brijesh Singh <brijesh.singh@amd.com>, 
	Isaku Yamahata <isaku.yamahata@intel.com>, Binbin Wu <binbin.wu@linux.intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[google.com,reject];
	MV_CASE(0.50)[];
	R_DKIM_ALLOW(-0.20)[google.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:seanjc@google.com,m:kvm@vger.kernel.org,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:clopez@suse.de,m:pbonzini@redhat.com,m:corbet@lwn.net,m:skhan@linuxfoundation.org,m:ashish.kalra@amd.com,m:michael.roth@amd.com,m:brijesh.singh@amd.com,m:isaku.yamahata@intel.com,m:binbin.wu@linux.intel.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[seanjc@google.com,linux-doc@vger.kernel.org];
	RCVD_COUNT_THREE(0.00)[4];
	TAGGED_FROM(0.00)[bounces-91713-lists,linux-doc=lfdr.de];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[seanjc@google.com,linux-doc@vger.kernel.org];
	DKIM_TRACE(0.00)[google.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: C1BD36628B0

On Wed, 03 Jun 2026 13:45:04 +0200, Carlos L=C3=B3pez wrote:
> KVM has reflected KVM_X86_SNP_VM to userspace since 1dfe571c12cf
> ("KVM: SEV: Add initial SEV-SNP support"), and KVM_X86_TDX_VM since
> 161d34609f9b ("KVM: TDX: Make TDX VM type supported"). Update the
> documentation to reflect this fact.
>=20
>=20

Applied to kvm-x86 misc, thanks!

[1/1] Documentation: KVM: Synchronize x86 VM types
      https://github.com/kvm-x86/linux/commit/65aa483f32ec

--
https://github.com/kvm-x86/linux/tree/next

