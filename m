Return-Path: <linux-doc+bounces-83284-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OCgRDKdj3WnmdQkAu9opvQ
	(envelope-from <linux-doc+bounces-83284-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Mon, 13 Apr 2026 23:44:07 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 8155D3F39B8
	for <lists+linux-doc@lfdr.de>; Mon, 13 Apr 2026 23:44:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1EBDD3080EBB
	for <lists+linux-doc@lfdr.de>; Mon, 13 Apr 2026 21:39:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5FA12395D9D;
	Mon, 13 Apr 2026 21:39:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CFLSBfk1"
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CF00395273
	for <linux-doc@vger.kernel.org>; Mon, 13 Apr 2026 21:39:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776116380; cv=none; b=q/P2BwxzzoeEQnfWjxnB3Y5NnI40fwXJikABBzNNs0HSp4swBq3F61FKAznGasYrvFCSzyVfugMzCJQ90/rv5DAHMAM+mANyqX2A7KI+xpxWR7YcEVrfRkaNz6IagCefwbizbhH0c9/tDYCPBpYOlzymU34K0rJo6Lp+KcGeI6U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776116380; c=relaxed/simple;
	bh=BYYLtxILWml7HLnHi7dzbwP+23u+hFpwZY9FDpuRDG8=;
	h=Date:From:To:Cc:Message-ID:In-Reply-To:References:Subject:
	 Mime-Version:Content-Type; b=UQTG7gJM5rc6geBEuMQbxayQvH4QmrkVWzKz1ZIwtMIsCzTZCmCnxO8zex6Q5VuFpRB6Gpa04KplnvE04/t3ezlxkAi0pNUhfdJ938ixRE1RjkyJ0BG+TBGpE97CIve9WAUPd4AIb+AyKxFLhBugkN/MkjuDcJnBhTUF39lFNdw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CFLSBfk1; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C3AD4C2BCB3
	for <linux-doc@vger.kernel.org>; Mon, 13 Apr 2026 21:39:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776116379;
	bh=BYYLtxILWml7HLnHi7dzbwP+23u+hFpwZY9FDpuRDG8=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
	b=CFLSBfk1etU5tXp0m4ZbBnbH0lXt1AISfATXd89wGDkoKHTIck1ZSuXnq2rfE9iv4
	 u0XRgXd7n1WgYCBUOWNx0TrUAL58drFVzKarmASWTzwRKG1ub7gep184qqZ/sX3eo5
	 pGn0d8IlylYbgtr91QGDqb628DT/dRXdK5MVQgbZr/pVLO+zNNJ5gnDHiPFyDttpsz
	 x5cb0y3hFYLx42YvX035z9lXZ+l7GPwkXPiAyW7n04Hob4AqaxID0EHvTl/zlugj7n
	 G1cbW4KWbGvdYC1Xx3h6WE3e18rMi66CllTWlsfiIQUsbC0XvANbPyZamNv/wGkfZE
	 JvXqv3CvYdTqg==
Received: from phl-compute-08.internal (phl-compute-08.internal [10.202.2.48])
	by mailfauth.phl.internal (Postfix) with ESMTP id D458BF40068;
	Mon, 13 Apr 2026 17:39:38 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-08.internal (MEProxy); Mon, 13 Apr 2026 17:39:38 -0400
X-ME-Sender: <xms:mmLdaTPSyQKtAyBTjG8pAGulIMa50ELpBdn9VHJOR32cc6H3tQKV7A>
    <xme:mmLdaW6ryIeC6PTJQUOx6hZiGpP7vQ7jCGfbz8ia8q2pHJH9b316_n3IZ13MBfLDg
    62F0yeTjYO5dh3bXCWhPXVWnTY9xQ3C8F6hjeYeXXxq8lUO06oOeHkW>
X-ME-Received: <xmr:mmLdad0ZF96Szs7LNoaQcFP2kxHjNrFYai7CisPEIJnX_C44uMF0kJcUrboX9EVBTWtKkKhiFXtddNXXYSJ8HPj6TMCwQV-DCJw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefhedrtddtgdefleefgecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpeffhffvvefkjghfufggtgfgsehtjeertddttdejnecuhfhrohhmpeffrghnucghihhl
    lhhirghmshcuoegujhgsfieskhgvrhhnvghlrdhorhhgqeenucggtffrrghtthgvrhhnpe
    elhfeiudfgvdeijedtleeltdduueekffejjedvjefhgeevjeefueejledtleetjeenucev
    lhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegujhgsfidomh
    gvshhmthhprghuthhhphgvrhhsohhnrghlihhthidqudejjedvfedtgeehhedqfeeffeel
    gedtgeejqdgujhgsfieppehkvghrnhgvlhdrohhrghesfhgrshhtmhgrihhlrdgtohhmpd
    hnsggprhgtphhtthhopeehpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopegtohhr
    sggvtheslhifnhdrnhgvthdprhgtphhtthhopehrughunhhlrghpsehinhhfrhgruggvrg
    gurdhorhhgpdhrtghpthhtoheplhhinhhugidqughotgesvhhgvghrrdhkvghrnhgvlhdr
    ohhrghdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlh
    drohhrghdprhgtphhtthhopeifohhrkhhflhhofihssehvghgvrhdrkhgvrhhnvghlrdho
    rhhg
X-ME-Proxy: <xmx:mmLdaXzSP8ZdOGzAtp5sVM2av2DNEVRnYo4Rwl2kH3VRem6r-ATEBQ>
    <xmx:mmLdaXthW5v3svEyXxVA6aPakMTlVc6a8HoboLMdLz5-ucOx3pMhYA>
    <xmx:mmLdaRxzzqpxLZFrz8rdFmivl-j2KQ0jG2qXSiNDcsJFo97VxChpqA>
    <xmx:mmLdaSD6lwGCBwtLu5iIHRQXidr8BFF-_ZbrrW8ePyTZQxStlTPVVA>
    <xmx:mmLdaXdeHh3Cy-fb7KRCwBaeVaR9Jy_JAKKv11fQtAn4ddBvOS7-QIp6>
Feedback-ID: i67ae4b3e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 13 Apr 2026 17:39:38 -0400 (EDT)
Date: Mon, 13 Apr 2026 14:39:37 -0700
From: Dan Williams <djbw@kernel.org>
To: Jonathan Corbet <corbet@lwn.net>, 
 Randy Dunlap <rdunlap@infradead.org>, 
 Linux Documentation <linux-doc@vger.kernel.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Cc: Linux Kernel Workflows <workflows@vger.kernel.org>
Message-ID: <69dd6299440be_147c801005b@djbw-dev.notmuch>
In-Reply-To: <87wlyawum7.fsf@trenco.lwn.net>
References: <b7775383-da94-4098-8af9-2f672c4f1a71@infradead.org>
 <87wlyawum7.fsf@trenco.lwn.net>
Subject: Re: maintainer profiles
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MV_CASE(0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-83284-lists,linux-doc=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_ALL(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[infradead.org:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,djbw-dev.notmuch:mid];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[djbw@kernel.org,linux-doc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 8155D3F39B8
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Jonathan Corbet wrote:
> Randy Dunlap <rdunlap@infradead.org> writes:
> 
> > Hi,
> >
> > Is there supposed to be a difference (or distinction) in the contents of
> >
> > Documentation/process/maintainer-handbooks.rst
> > and
> > Documentation/maintainer/maintainer-entry-profile.rst
> > ?
> >
> > Can they be combined into one location?
> 
> Late to the party, sorry ... the original idea, I believe, was that
> maintainer-handbooks.rst would be for developers looking for a guidebook
> for a specific subsystem, while maintainer-entry-profile.rst was about
> how maintainers themselves should write their subsystem guide.
> Doubtless things have drifted since then...  But the intended audiences
> were different, so it might be good to think about bringing them back
> into focus.

Right, I think something (roughly / hand-wavy) like the below is the
intent. However, as I write that I notice that the combined list is a
bit of a mess. I also notice that there are more "P:" entries in
MAINTAINERS than there are entries in this maintainer-handbooks.rst
list.

So this probably wants to be a script that can build Documentation links
from MAINTAINERS, or otherwise provide a script for developers to query
a kernel tree for additional submission guides. It is probably not as
important for the built docs to link all guides as it is for developers
(or their agents) to live query a tree they are developing against.

Note the problem goes both ways, there are P: entries not in the
combined handbook list, like the Security subsystem, and there are
handbook entries without a P:, like the Tip tree.

diff --git a/Documentation/maintainer/maintainer-entry-profile.rst b/Documentation/maintainer/maintainer-entry-profile.rst
index 6020d188e13d..58e2af333692 100644
--- a/Documentation/maintainer/maintainer-entry-profile.rst
+++ b/Documentation/maintainer/maintainer-entry-profile.rst
@@ -92,24 +92,8 @@ full series, or privately send a reminder email. This section might also
 list how review works for this code area and methods to get feedback
 that are not directly from the maintainer.
 
-Existing profiles
------------------
-
-For now, existing maintainer profiles are listed here; we will likely want
-to do something different in the near future.
-
-.. toctree::
-   :maxdepth: 1
-
-   ../doc-guide/maintainer-profile
-   ../nvdimm/maintainer-entry-profile
-   ../arch/riscv/patch-acceptance
-   ../process/maintainer-soc
-   ../process/maintainer-soc-clean-dts
-   ../driver-api/media/maintainer-entry-profile
-   ../process/maintainer-netdev
-   ../driver-api/vfio-pci-device-specific-driver-acceptance
-   ../nvme/feature-and-quirk-policy
-   ../filesystems/nfs/nfsd-maintainer-entry-profile
-   ../filesystems/xfs/xfs-maintainer-entry-profile
-   ../mm/damon/maintainer-profile
+Maintainer Handbooks
+--------------------
+
+For examples of other subsystem handbooks see
+Documentation/process/maintainer-handbooks.rst.
diff --git a/Documentation/process/maintainer-handbooks.rst b/Documentation/process/maintainer-handbooks.rst
index 976391cec528..bc9299a04b1f 100644
--- a/Documentation/process/maintainer-handbooks.rst
+++ b/Documentation/process/maintainer-handbooks.rst
@@ -9,14 +9,33 @@ The purpose of this document is to provide subsystem specific information
 which is supplementary to the general development process handbook
 :ref:`Documentation/process <development_process_main>`.
 
+For developers, see below for all the known subsystem specific guides.
+If the subsystem you are contributing to does not have a guide listed
+here, it is fair to seek clarification of questions raised in
+Documentation/maintainer/maintainer-entry-profile.rst.
+
+For maintainers, consider documenting additional requirements and
+expectations if submissions routinely overlook specific submission
+criteria. See Documentation/maintainer/maintainer-entry-profile.rst.
+
 Contents:
 
 .. toctree::
    :numbered:
    :maxdepth: 2
 
+   maintainer-kvm-x86
    maintainer-netdev
    maintainer-soc
    maintainer-soc-clean-dts
+   maintainer-soc-clean-dts
    maintainer-tip
-   maintainer-kvm-x86
+   ../arch/riscv/patch-acceptance
+   ../doc-guide/maintainer-profile
+   ../driver-api/media/maintainer-entry-profile
+   ../driver-api/vfio-pci-device-specific-driver-acceptance
+   ../filesystems/nfs/nfsd-maintainer-entry-profile
+   ../filesystems/xfs/xfs-maintainer-entry-profile
+   ../mm/damon/maintainer-profile
+   ../nvdimm/maintainer-entry-profile
+   ../nvme/feature-and-quirk-policy



