Return-Path: <linux-doc+bounces-92558-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id l+XjEczQMWrKqgUAu9opvQ
	(envelope-from <linux-doc+bounces-92558-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Wed, 17 Jun 2026 00:40:12 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C156C6959FF
	for <lists+linux-doc@lfdr.de>; Wed, 17 Jun 2026 00:40:11 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=google.com header.s=20251104 header.b=QbnZueM6;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-92558-lists+linux-doc=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-doc+bounces-92558-lists+linux-doc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=google.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C8EB631DBC72
	for <lists+linux-doc@lfdr.de>; Tue, 16 Jun 2026 22:38:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ED8313E7BBB;
	Tue, 16 Jun 2026 22:38:14 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33B213E5578
	for <linux-doc@vger.kernel.org>; Tue, 16 Jun 2026 22:38:11 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781649494; cv=none; b=NFDiS7j0bU1CG5BuCOp5e8FzhgVzr7jDwcty+cOQFt1fhS+YCi7WWbk/5NBqs5QmtlZgSv2axF3Qyj2wbWhcVoMUcuqBA5FO6FpIMwYUJu4lbxUJIc+kDs2dItIrR6JoAi+eh3Sdi2GkDPG0upAhBDvWPjAYHBWxymAhbdSg1R0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781649494; c=relaxed/simple;
	bh=SzOIf7pvTrhn5azy2CCHd4TxIzP64uBs5kiqdkjXq5o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=n1yYnK3zFCFbeJF6D7TwFI5FNetKcxGxp+qwVKT//kUoLPths7kNE3NSAdO0bdRzP+yonoPyYDUPZgTp1a6B08wPrVwU20nKx5UFNh6xBwoYXMETiJVrMAz044IU/YUyP9nah2o9qEZSjGHo4SAQt31GbdMt9VbQTyiaHQTj0XE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=QbnZueM6; arc=none smtp.client-ip=209.85.214.170
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2c6b7bd4e8dso21705ad.0
        for <linux-doc@vger.kernel.org>; Tue, 16 Jun 2026 15:38:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1781649491; x=1782254291; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=0bi42mNvv8zEfpJesfq39j8DzoTdUbmNl2yt46Rb57o=;
        b=QbnZueM6ZrZ1i34YoGwEFSctVn8vZ30eZy8Cj0jkYaQ2oHzydDCYeYWL8eXHHmN0oz
         sxejt3JsBp7hqsl6JUpE3kagC9pdEDCU38fCovX2tzSjdAdxTAQ1P2uih2MuVuEjh2Kl
         3R4YYFfhfLkPajeHJTpYghozWjpkOcZnRnXzJaK+ApntQLVuT415Jm9rM5R2394RamE4
         gzliVNpODem0ch+eUAcYFy8QWv0u/IHoF7jO3MFGFQJBJHCWSbt6KEegjoDZixQcbaX4
         YI0A4kQdyyUsIOCWNANPDI+9Qu9TxoDU55b7S2s2oM+LzJ5a0qGJeUPA0EqRzdf/fchT
         lomQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781649491; x=1782254291;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0bi42mNvv8zEfpJesfq39j8DzoTdUbmNl2yt46Rb57o=;
        b=biR6pjKhoeMxgj0g+oVUpo+vOwyjzBWbE9QUGDG7TjLXfXzRgqEYEIHmeBRM8dDnO2
         HzqQTfj9GimnK2Eyvya3xfnNERf7SXuAhgOKaPwl5cu0/pJWCXW9nAaPVgdZVLYLAXvR
         swgRHHf3nobSTxr3wySnYSi7XuoFzRc0k7o8SWyyjU2S89RwApj1nuPa9ObNdP6u8nzi
         VSipBQVAvCyU+s2xh8KKwO8AKlvLrSPl5GwfaXUIaAW0Cs6O+enpwujltA4hMm9Fo3HJ
         PrelCmfC3G6TasqSBWqZi6j+EOOU0ru5aVnSCy4I3I8N2WDlfWYOilh/1SSs55D8THvu
         CFlw==
X-Forwarded-Encrypted: i=1; AFNElJ/q1U3YE3gm4DR64ymB8+0GBWouKQoLZgnzoG8VbTpaLPQKBP+MFgVo1IsgY2V0SS1SoVzZKJS54lw=@vger.kernel.org
X-Gm-Message-State: AOJu0YxjXS1P6GxEyq5fM4TMRZU+IuVzxmVKYt+cgatZl6wXh9nPiVrG
	DOBDMpogNk39p1oU+SeMVx5ewb05yHpFo8u3ykXLvr/tnJtRkKTyE7npqpZpvHICJg==
X-Gm-Gg: AfdE7ckxjbxJAsf/To6d6c2mcvG5MSOpjjjDh1iDWFq8EmjbShrspFGEqCH+G1vriwp
	Zf2ldW7HhIJzCawgkZMJRZjMXb0hLbyKnBzdAhATj7Cb/8ENz5b7qjcnp0V58pYjVUl9NBXRlHZ
	zu4gccQsdNF+RxxOIm5WNEkZ20HguXyEIx6FpjoqokjkCd6FxXHC4Z3R5TCFyiPsFGnD9lZYPIF
	Y8wPjqxdFeLyaHnN6hkiigrgdFyc3OZqd5ZFiFvuH/i9Bk/F5wNQu47G/KirdH4OfViYqTSoNrB
	J52gkNJFG5RhxBY1eeTx/11w3pJ2AdBw2G/JYGe1+gwVdCjX33k0HFCOqj6bdsFmFPO3SrALJ+V
	XAf2+hjrsXpUuh5VyYIH69cw2M5svu+5jkI2gMPyQgzYI0TNcHLrE2i4IAP02PPFKqMvritVh8Q
	z3wYauFq9DwyVuIy4Pf96hG9pBxvCwQquJX0WyU0Zo3h5EnYQVN1TA5M8xMuhxMI1ycStokD+CY
	3FDBaea2HjswVK30xM=
X-Received: by 2002:a17:903:289:b0:2bf:2e8c:db96 with SMTP id d9443c01a7336-2c6bd35b47fmr636505ad.5.1781649488392;
        Tue, 16 Jun 2026 15:38:08 -0700 (PDT)
Received: from google.com (25.75.145.34.bc.googleusercontent.com. [34.145.75.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c42f2e5590sm159640205ad.14.2026.06.16.15.38.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jun 2026 15:38:07 -0700 (PDT)
Date: Tue, 16 Jun 2026 22:38:04 +0000
From: Samiullah Khawaja <skhawaja@google.com>
To: David Matlack <dmatlack@google.com>
Cc: kexec@lists.infradead.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, linux-pci@vger.kernel.org, 
	Adithya Jayachandran <ajayachandra@nvidia.com>, Alexander Graf <graf@amazon.com>, 
	Alex Williamson <alex@shazbot.org>, Bjorn Helgaas <bhelgaas@google.com>, 
	Chris Li <chrisl@kernel.org>, David Rientjes <rientjes@google.com>, 
	Jacob Pan <jacob.pan@linux.microsoft.com>, Jason Gunthorpe <jgg@nvidia.com>, 
	Jonathan Corbet <corbet@lwn.net>, Josh Hilke <jrhilke@google.com>, 
	Leon Romanovsky <leonro@nvidia.com>, Lukas Wunner <lukas@wunner.de>, Mike Rapoport <rppt@kernel.org>, 
	Parav Pandit <parav@nvidia.com>, Pasha Tatashin <pasha.tatashin@soleen.com>, 
	Pranjal Shrivastava <praan@google.com>, Pratyush Yadav <pratyush@kernel.org>, 
	Saeed Mahameed <saeedm@nvidia.com>, Shuah Khan <skhan@linuxfoundation.org>, 
	Vipin Sharma <vipinsh@google.com>, William Tu <witu@nvidia.com>, Yi Liu <yi.l.liu@intel.com>
Subject: Re: [PATCH v6 03/12] PCI: liveupdate: Track incoming preserved PCI
 devices
Message-ID: <ajHOd1lkBJTySVif@google.com>
References: <20260522202410.3104264-1-dmatlack@google.com>
 <20260522202410.3104264-4-dmatlack@google.com>
 <ajGpxMXk9iyXLzC4@google.com>
 <CALzav=eo=UwoTNTYM8Z7uKoihxfB7NtVP701qidVgoqyBKhUig@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CALzav=eo=UwoTNTYM8Z7uKoihxfB7NtVP701qidVgoqyBKhUig@mail.gmail.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[google.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[google.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-92558-lists,linux-doc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:dmatlack@google.com,m:kexec@lists.infradead.org,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-mm@kvack.org,m:linux-pci@vger.kernel.org,m:ajayachandra@nvidia.com,m:graf@amazon.com,m:alex@shazbot.org,m:bhelgaas@google.com,m:chrisl@kernel.org,m:rientjes@google.com,m:jacob.pan@linux.microsoft.com,m:jgg@nvidia.com,m:corbet@lwn.net,m:jrhilke@google.com,m:leonro@nvidia.com,m:lukas@wunner.de,m:rppt@kernel.org,m:parav@nvidia.com,m:pasha.tatashin@soleen.com,m:praan@google.com,m:pratyush@kernel.org,m:saeedm@nvidia.com,m:skhan@linuxfoundation.org,m:vipinsh@google.com,m:witu@nvidia.com,m:yi.l.liu@intel.com,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[skhawaja@google.com,linux-doc@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[28];
	DKIM_TRACE(0.00)[google.com:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[skhawaja@google.com,linux-doc@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: C156C6959FF

On Tue, Jun 16, 2026 at 03:20:33PM -0700, David Matlack wrote:
>On Tue, Jun 16, 2026 at 1:09 PM Samiullah Khawaja <skhawaja@google.com> wrote:
>>

[snip]

>>
>> Hmm.. This is interesting, so the KHO state is freed and it cannot be
>> reused. I see you already pointed out that we are putting an LUO policy
>> to say that the retry is not allowed.
>>
>> But what should be the behaviour of liveupdate in this regard? Let the
>> system boot in a normal way? This might break other subsystems as they
>> might depend on PCIe restoring state properly. Also I think some of the
>> PCIe state, like device-id, BAR addresses, ACLs etc, might be used as
>> source of truth by other components.
>>
>> For example, lets say FLB retrieve() of PCIe fails, but succeeds for
>> VFIO/IOMMU, now VFIO/IOMMU are restoring state of a device that is not
>> restored/preserved?
>>
>> Should this be considered fatal?
>
>If PCI FLB retrieve fails then there are certain things that cannot be
>guaranteed, such as BDF (B specifically) remaining constant. This
>could lead to memory corruption as the IOMMU may have live
>translations in place for those specific RequesterIDs. And, in the
>future, preserved devices may be doing P2P which depends on BARs not
>moving. If the PCI core cannot retrieve the FLB saved by the previous
>kernel, it cannot make these guarantees.

Yes, this is what I was worried about.
>
>So yeah I think you're right that PCI core should treat FLB retrieve
>as fatal and just panic.

This sounds great.
>
>> > }
>> >
>> > static void pci_flb_finish(struct liveupdate_flb_op_args *args)
>> > {
>> >-      kho_restore_free(args->obj);
>> >+      struct pci_flb_incoming *incoming = args->obj;
>> >+
>> >+      xa_destroy(&incoming->xa);
>> >+      kho_restore_free(incoming->ser);
>> >+      kfree(incoming);
>> > }
>> >
>> > static struct liveupdate_flb_ops pci_liveupdate_flb_ops = {
>> >@@ -270,6 +335,91 @@ void pci_liveupdate_unpreserve(struct pci_dev *dev)
>> > }
>> > EXPORT_SYMBOL_GPL(pci_liveupdate_unpreserve);
>> >
>> >+static struct pci_flb_incoming *pci_liveupdate_flb_get_incoming(void)
>> >+{
>> >+      struct pci_flb_incoming *incoming = NULL;
>> >+      int ret;
>> >+
>> >+      ret = liveupdate_flb_get_incoming(&pci_liveupdate_flb, (void **)&incoming);
>> >+
>> >+      /* Live Update is not enabled. */
>> >+      if (ret == -EOPNOTSUPP)
>> >+              return NULL;
>> >+
>> >+      /* Live Update is enabled, but there is no incoming FLB data. */
>> >+      if (ret == -ENODATA)
>> >+              return NULL;
>> >+
>> >+      /*
>> >+       * Live Update is enabled and there is incoming FLB data, but none of it
>> >+       * matches pci_liveupdate_flb.compatible.
>> >+       *
>> >+       * This could mean that no PCI FLB data was passed by the previous
>> >+       * kernel, but it could also mean the previous kernel used a different
>> >+       * compatibility string (i.e. a different ABI).
>> >+       */
>> >+      if (ret == -ENOENT) {
>> >+              pr_info_once("No incoming FLB matched %s\n", pci_liveupdate_flb.compatible);
>> >+              return NULL;
>> >+      }
>> >+
>> >+      /*
>> >+       * There is incoming FLB data that matches pci_liveupdate_flb.compatible
>> >+       * but it cannot be retrieved.
>> >+       */
>> >+      if (ret) {
>> >+              WARN_ONCE(ret, "Failed to retrieve incoming FLB data\n");
>>
>> I think this should probably be considered fatal as mentioned above or
>> the caller of this function should get an error so it can fail. I think
>> retrievel of preserved state should generally not fail unless there is
>> memory corruption or ABI is incompatible.
>
>Yeah. I think I will just call panic() here to cover all cases.

We have an luo specific panic macro/function that you can use.

luo_restore_fail()
>
>> >+              return NULL;
>> >+      }
>> >+
>> >+      return incoming;
>> >+}
>> >+
>>
>> [snip]
>> >+
>> >+static inline bool pci_liveupdate_is_incoming(struct pci_dev *dev)
>> >+{
>> >+      return false;
>> >+}
>> > #endif
>> >
>> > #endif /* LINUX_PCI_LIVEUPDATE_H */
>> >--
>> >2.54.0.746.g67dd491aae-goog
>> >
>>
>> Sami

