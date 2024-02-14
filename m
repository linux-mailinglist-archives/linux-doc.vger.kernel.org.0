Return-Path: <linux-doc+bounces-9355-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5736D854D85
	for <lists+linux-doc@lfdr.de>; Wed, 14 Feb 2024 17:01:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7A17D1C243A1
	for <lists+linux-doc@lfdr.de>; Wed, 14 Feb 2024 16:01:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8899B5DF0F;
	Wed, 14 Feb 2024 16:01:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="QAk/HqLg"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-pl1-f201.google.com (mail-pl1-f201.google.com [209.85.214.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F30355D8EF
	for <linux-doc@vger.kernel.org>; Wed, 14 Feb 2024 16:01:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707926494; cv=none; b=STp4mnYBK7IRJXGWxo/TJ1RPyrOxnCozaIAFVZnjxy+jipmH20GkdBf/eE7nvd1lxFYEi1kd7Now6foapkeFfycs87Fo6L10kbZbJl2W3Cr0MEo5duu3OzCP7bNdmpaumt8B+18R14wi7wZfPOTWjV0i7cJNsZUlck6CVCB9eBY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707926494; c=relaxed/simple;
	bh=mG2aiDwQBefPaMNK+Pn14SJya/ggnAhZnM5ZfZrJYyQ=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=m2SaYLHe6LTYGF+m6NAox64G8Vm3Rbj+wrjtR3Tce0m/k/cCVo0JJxLyejqpnzo9PLXxylSlOlpuWEhD6QlpTuCvn3+qvz+4s8yxdsID9mnt2/uElwK7r7bwcYVFwGODI4lPfxYHL6d8lyHlrm1CbETtCiWv5yOjSROdaQDkZOg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=QAk/HqLg; arc=none smtp.client-ip=209.85.214.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Received: by mail-pl1-f201.google.com with SMTP id d9443c01a7336-1d932f1c0fbso61350835ad.0
        for <linux-doc@vger.kernel.org>; Wed, 14 Feb 2024 08:01:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1707926492; x=1708531292; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vDhKhdgpExvnvihe9iHfOSKknaCWEhikPiTvyAPPe10=;
        b=QAk/HqLgYjvy6Jd8ZrrIpX6BQReMTR4BJ8VfS2KyGocywH12mm9VdOhAw2qDL75zrB
         INDry1X9/zQMf/DG3o8l1hIO1MW4M5Gleiv3DQsvUVg+MTsoft9wvAN/sY1iZIpgtGbB
         95pjxJWCoVYDFlRjblZsJGDfI2iQb/lb7KKQMcOzp2obWq5n7sul+XXos3e4ttoWhynb
         LvyPWLC6SWMEanMLdRIIq6v65kWPKhHWWoC8rsx/cgFh0k83Nskf5/0YBLDeTlLlbFU/
         pobeXxvQKcElKVjofGXavU2MLDzIuTFNV7NwBi7YA8n23gjqZcQbzrkqT+ohGlAGfVWw
         whLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707926492; x=1708531292;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=vDhKhdgpExvnvihe9iHfOSKknaCWEhikPiTvyAPPe10=;
        b=DnscgTlNitv33ZDp6QhUjNDG85gW+D13U5WOxJZTZ6HDyuZsXGwnbhSCZPGE7seGmJ
         YNYp70TZmoJNDxvulmVyNQfPg/XCdD6vK8f4KhYZpqEd6HXfQzCv0wb2UFFKD6tK03uP
         RDRdXZIICWm9cErKcljIgouvaL4Iz/d3jnv5wStNwD9N56M64RkASkOcAo8WG5AFpQpw
         EffYn84mV1qWT5DQGp82EV3L0s0zTDpOIk934gT7NpjNAfslbCCK9sO0RN5QEgprKL8h
         sBUIZjOzwbBx4f6NldEjIWCqbduW6YM18Jl0RsqNOHItDw0DDwPJKXeWhqEuRCOFitIn
         QkXw==
X-Forwarded-Encrypted: i=1; AJvYcCUXtKvV/cyOH0EXZMI9AUxHLLqg3RaKatgzlVGd2esZvxrh6MXROz5K4Zc7ocac+p7Xpyok/nx2BDd3486SVhSk+Duw3MkRbH4Y
X-Gm-Message-State: AOJu0Yzul5W3XgDlGqi23J5PTA8UQhBVKxgm1JSetoZBCxd97OArRJl5
	nku9dCPFpszJnpuP6BGjBSkLKoE9uZymxtUdwHR7rSHNMhQ9TolmH2o4/BepoMNNhNFdN468CEY
	RMw==
X-Google-Smtp-Source: AGHT+IEN5+ID23PuzUqCy4d+vfh2sapVveap2dWxTrMhCE/ZUr1g7/fVADAe/6OhrogxAp4oYhMwc7tWtgg=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a17:902:b90a:b0:1d9:f334:d9c5 with SMTP id
 bf10-20020a170902b90a00b001d9f334d9c5mr8303plb.10.1707926492284; Wed, 14 Feb
 2024 08:01:32 -0800 (PST)
Date: Wed, 14 Feb 2024 08:01:30 -0800
In-Reply-To: <7c31e31d0f0ad3f40619f8e0ecf67f1e3d3eef5f.camel@infradead.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20240115125707.1183-1-paul@xen.org> <20240115125707.1183-9-paul@xen.org>
 <ZcMBDP6H5PRo5C2d@google.com> <7c31e31d0f0ad3f40619f8e0ecf67f1e3d3eef5f.camel@infradead.org>
Message-ID: <Zczj2vDCasKcBcjn@google.com>
Subject: Re: [PATCH v12 08/20] KVM: pfncache: allow a cache to be activated
 with a fixed (userspace) HVA
From: Sean Christopherson <seanjc@google.com>
To: David Woodhouse <dwmw2@infradead.org>
Cc: Paul Durrant <paul@xen.org>, Paolo Bonzini <pbonzini@redhat.com>, Jonathan Corbet <corbet@lwn.net>, 
	Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Shuah Khan <shuah@kernel.org>, kvm@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, 
	Christian Borntraeger <borntraeger@linux.ibm.com>, Janosch Frank <frankja@linux.ibm.com>, 
	Claudio Imbrenda <imbrenda@linux.ibm.com>, David Hildenbrand <david@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 06, 2024, David Woodhouse wrote:
> On Tue, 2024-02-06 at 20:03 -0800, Sean Christopherson wrote:
> > +s390 folks (question on kvm_is_error_gpa() for ya)
> >=20
> > On Mon, Jan 15, 2024, Paul Durrant wrote:
> > > @@ -1398,7 +1414,9 @@ void kvm_gpc_deactivate(struct gfn_to_pfn_cache=
 *gpc);
> > > =C2=A0 static inline void kvm_gpc_mark_dirty(struct gfn_to_pfn_cache =
*gpc)
> > > =C2=A0 {
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0lockdep_assert_held(&=
gpc->lock);
> > > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0mark_page_dirty_in_slot(gp=
c->kvm, gpc->memslot, gpc->gpa >> PAGE_SHIFT);
> > > +
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (gpc->gpa !=3D KVM_XEN_=
INVALID_GPA)
> >=20
> > KVM_XEN_INVALID_GPA absolutely doesn't belong in common code.=C2=A0 Not=
 to mention
> > that it will break when Paolo (rightly) moves it to an x86 header.
> >=20
> > https://lore.kernel.org/all/20240131233056.10845-3-pbonzini@redhat.com
>=20
> We can use plain INVALID_GPA for that, I think. ISTR the reason we have
> a separate KVM_XEN_INVALID_GPA is because that's a userspace API.
>=20
> ...
>=20
> > But!  kvm_is_error_gpa() already exists, and it very, very sneakily
> > does a memslot lookup and checks for a valid HVA.
>=20
> Hm, that doesn't sound as fast as simple comparison. We also can't do
> it from kvm_gpc_check(), can we?

You snipped the part where I suggested renaming the existing kvm_is_error_g=
pa().

I am suggesting we do the below (and obviously rename the s390 usage, too),=
 and
then the gpc code can use use kvm_is_error_gpa().

diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
index bbfefd7e612f..e1df988e4d57 100644
--- a/include/linux/kvm_host.h
+++ b/include/linux/kvm_host.h
@@ -148,6 +148,11 @@ static inline bool kvm_is_error_hva(unsigned long addr=
)
=20
 #endif
=20
+static inline bool kvm_is_error_gpa(gpa_t gpa)
+{
+       return gpa =3D=3D INVALID_GPA;
+}
+
 #define KVM_ERR_PTR_BAD_PAGE   (ERR_PTR(-ENOENT))
=20
 static inline bool is_error_page(struct page *page)
@@ -1787,7 +1792,7 @@ static inline hpa_t pfn_to_hpa(kvm_pfn_t pfn)
        return (hpa_t)pfn << PAGE_SHIFT;
 }
=20
-static inline bool kvm_is_error_gpa(struct kvm *kvm, gpa_t gpa)
+static inline bool kvm_gpa_is_in_memslot(struct kvm *kvm, gpa_t gpa)
 {
        unsigned long hva =3D gfn_to_hva(kvm, gpa_to_gfn(gpa));
=20

