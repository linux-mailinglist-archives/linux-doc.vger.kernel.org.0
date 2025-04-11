Return-Path: <linux-doc+bounces-42981-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 863C0A86856
	for <lists+linux-doc@lfdr.de>; Fri, 11 Apr 2025 23:32:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AAF2A189B35B
	for <lists+linux-doc@lfdr.de>; Fri, 11 Apr 2025 21:33:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 76A7E29B237;
	Fri, 11 Apr 2025 21:32:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="LMOt1crC"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-pl1-f202.google.com (mail-pl1-f202.google.com [209.85.214.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEAE5280A45
	for <linux-doc@vger.kernel.org>; Fri, 11 Apr 2025 21:32:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744407173; cv=none; b=ef6D1rlg8k6mVhNvfxNuZo/CwWT5F5GMm11h2vhpeFGzEfP1FWdXwNQoGUDWdKdd9h4dsNT4EtHvdr1eWHNXSAAiBFi5Jcxxa6UKrT8Y8FQbpQx9QkXVATovmxAeQGzQ//Zivj7Es/q+rhubEZ9gC+khAbZ9ROWtYyKgqNQfhus=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744407173; c=relaxed/simple;
	bh=/3tH8CvukO+vlevVOFlntDYEjBrYdIAzSgCsbqTQLxI=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=oVjlPfbX/GNc+CiyQ6sXXkSRpyDqTuFxFoDO8KuaV27tILKn/7mRZN+eTzNBH8BU+2y3x8hMNE6/bO5qRyd0KK/p0TlLdDGsPMJzS07h0llEOTZwnafWuhFwI+Bmit06o54nZxNwj6uWQdPuwuFvcx3exh/3jQYIikjt2hIwMlU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=LMOt1crC; arc=none smtp.client-ip=209.85.214.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Received: by mail-pl1-f202.google.com with SMTP id d9443c01a7336-2254e500a73so18449125ad.0
        for <linux-doc@vger.kernel.org>; Fri, 11 Apr 2025 14:32:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1744407171; x=1745011971; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=K1L8eJTBYOe3IqPq2LCTPLnMwB1yCh94JwNwUb/2VUY=;
        b=LMOt1crCRQs73eNK2HbRb9PqL0BMPWtRzEolG5uHstDhtEf6oySC8qL8wXuxEcGGlw
         BR1D+F2lQNPzP75CsCeXYG5c3kJHdmXo9a1kW2pVoMZyPwemqYA+zajtzMDCi8/cnXuS
         r3mpjyyx7LfG4900x6md4uTxy3EpqOwiWLTkJEHB/dpAKW45qM6t3YTEkuzEljFWydw/
         fdntwATFSZZReekXEs9GYif0OFS62ygEV+Ge1s4ojEP+ErT/eySDKOXeC/pdO3K8CM1n
         5s+NqTpF56oW6pv3e5a394w48ZUaP7dmaDgUvWz9irepb7efgmgQxnQcK5ejyeUWeP/f
         1chw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744407171; x=1745011971;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=K1L8eJTBYOe3IqPq2LCTPLnMwB1yCh94JwNwUb/2VUY=;
        b=OatHNme9w+udA5U+BT+z6buSA8a5rPEImuMxILE+7lK/Sz1vql0Py1vG5EpDMaFV4A
         vtWyB+Yek59QHf4b9OVdfdNJgBV+11U5uCrmVRmZJxIUBq6jNr/msBcnwbXxc7UDLaj+
         sih5qrvofnn5o9WhgMVOnlKg+hSQKDKqQAJ0/JgmmXs2XzU9vrHJ/qM9quFQWfm+jnIm
         QVf8W2rhQTvWrtZyboOQdBk11g3LpVlBd4p5eJlGqQJqN7//vsK5ssG3BYd2RN3fycx4
         qxo5iq0Jlnusogp70vXPJG2xxgS9nOHXIVDnpIaTE7Z49Ew4jEBi4tfsypAOoRgEWk5S
         2EIw==
X-Forwarded-Encrypted: i=1; AJvYcCVhjoKDLMsG7pO5ZB1X/IOlpZvEC8T2JQP1hVHf/JaaTAvTKnFbqy0XdnG2asGzqS3+fjTlP7NHPlI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx/MgSJrCrExWsm2z34AUryxUcIlxgb3rperJStXp1xs7/3Ir6x
	LcZcjafZ5mPEubWDlgm2i9040KRO2MLf4c+llD4MB21/P+h91zM3HY9Uqavf1YmsGnh7B57NfIe
	5Yw==
X-Google-Smtp-Source: AGHT+IGWRveftZO1wji7CvlkOdr/kE0uz4l6esz3nDwfvBuY+d4Ew0jp3EjBMobySbyO9+duVZkiSgztRF8=
X-Received: from pfvf19.prod.google.com ([2002:a05:6a00:1ad3:b0:732:51fc:618f])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:cccd:b0:224:910:23f6
 with SMTP id d9443c01a7336-22bea4fcc8dmr67226125ad.45.1744407171250; Fri, 11
 Apr 2025 14:32:51 -0700 (PDT)
Date: Fri, 11 Apr 2025 14:32:49 -0700
In-Reply-To: <b06b187a-54e2-460e-8fc5-b440184b6f7a@oracle.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250410204149.2576104-1-ross.philipson@oracle.com>
 <20250410204149.2576104-2-ross.philipson@oracle.com> <f816c36c-cb7e-4143-b58c-f96a40699f7a@oracle.com>
 <b06b187a-54e2-460e-8fc5-b440184b6f7a@oracle.com>
Message-ID: <Z_mKgfZznBZgS-Pb@google.com>
Subject: Re: [PATCH v13 01/19] Documentation/x86: Secure Launch kernel documentation
From: Sean Christopherson <seanjc@google.com>
To: ross.philipson@oracle.com
Cc: ALOK TIWARI <alok.a.tiwari@oracle.com>, linux-kernel@vger.kernel.org, x86@kernel.org, 
	linux-integrity@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-crypto@vger.kernel.org, kexec@lists.infradead.org, 
	linux-efi@vger.kernel.org, iommu@lists.linux.dev, 
	dpsmith@apertussolutions.com, tglx@linutronix.de, mingo@redhat.com, 
	bp@alien8.de, hpa@zytor.com, dave.hansen@linux.intel.com, ardb@kernel.org, 
	mjg59@srcf.ucam.org, James.Bottomley@hansenpartnership.com, peterhuewe@gmx.de, 
	jarkko@kernel.org, jgg@ziepe.ca, luto@amacapital.net, nivedita@alum.mit.edu, 
	herbert@gondor.apana.org.au, davem@davemloft.net, corbet@lwn.net, 
	ebiederm@xmission.com, dwmw2@infradead.org, baolu.lu@linux.intel.com, 
	kanth.ghatraju@oracle.com, andrew.cooper3@citrix.com, 
	trenchboot-devel@googlegroups.com
Content-Type: text/plain; charset="us-ascii"

On Fri, Apr 11, 2025, ross.philipson@oracle.com wrote:
> On 4/10/25 10:50 PM, ALOK TIWARI wrote:
> > 
> > 
> > On 11-04-2025 02:11, Ross Philipson wrote:
> > > +
> > > + - Entry from the dynamic launch jumps to the SL stub.
> > > + - SL stub fixes up the world on the BSP.
> > > + - For TXT, SL stub wakes the APs, fixes up their worlds.
> > > + - For TXT, APs are left halted using MONITOR/MWAIT intructions.
> > 
> > typo intructions -> instruction
> 
> Thanks for the review. They are two separate instructions so is this really
> incorrect?

From the peanut gallery, I'd just drop the "instruction(s)" qualifier, i.e.

	- For TXT, APs are left halted using MONITOR/MWAIT.

Pedantically, it's the combination of MONTIOR+MWAIT that puts the CPU into a
sleep state, not the individual instructions.

And while I'm picking nits, the documentation is also a bit misleading as the CPU
isn't halted per se.  I'd go with something like:

	- For TXT, APs are left in an optimized (MONITOR/MWAIT) wait state.

