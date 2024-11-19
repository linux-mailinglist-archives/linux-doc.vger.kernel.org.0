Return-Path: <linux-doc+bounces-31147-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E8CB79D2DD7
	for <lists+linux-doc@lfdr.de>; Tue, 19 Nov 2024 19:23:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 85F90283AE5
	for <lists+linux-doc@lfdr.de>; Tue, 19 Nov 2024 18:23:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2925E1D1F56;
	Tue, 19 Nov 2024 18:23:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="BdCmwlTg"
X-Original-To: linux-doc@vger.kernel.org
Received: from out-186.mta0.migadu.com (out-186.mta0.migadu.com [91.218.175.186])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48ED81D097F
	for <linux-doc@vger.kernel.org>; Tue, 19 Nov 2024 18:23:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.186
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732040632; cv=none; b=tlSru+DKLgEyUwn0FjNBWPinxlTPul0MT7zBfmwEW79doAx9QrZfTSidq5ytx91/WY/6S3SboEHrYNMFDx30SttJ+RYtSvoMvyDHL02gebOzMWFsHFU40XGgHq1m4v1edIkZzMaLRVSEANKMNQnT4JICqQJ+vZozvIbpsNRoEhU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732040632; c=relaxed/simple;
	bh=aROzyJVKldykQ9mgj5sUXp0JM5O550BBkgEilNflqX8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SCJF/PeUeXG6tpYFv/UZIL1V3deFrrJg8YSRTuXUHbk4QYNU7Z2EpzZpKYLHZvASsoJ5ABPFW1+jlsmVJnvYnrOhkfwvpTwZM7aS32GVZal6X0hwmMn+HoDSV2NsV1SpSdSH4rfzD8/q5CmMhakpg9/Z+koH9HJLQnTD0rnTXyc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=BdCmwlTg; arc=none smtp.client-ip=91.218.175.186
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Date: Tue, 19 Nov 2024 18:23:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1732040627;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rf6WSCMrJOkcRsvsaOzgX4yrr/etHfGHR+l3wYcnl34=;
	b=BdCmwlTgF/04N1MU0Eyq/59hgreDyKCtmNquOkUG176dQ3JEXimKSzLIShy4EXDl2adRio
	TNOAZVCy9vETfjieegFPUSeQGvhYVQlwfLBdUHmzOaeH8Se+X5c7jc5EWHafWwm42S7Z+V
	jwvsMB+WjyH1lymPDI/BB7b0/6dXDTs=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Roman Gushchin <roman.gushchin@linux.dev>
To: Pasha Tatashin <pasha.tatashin@soleen.com>
Cc: Greg KH <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org,
	linux-mm@kvack.org, linux-doc@vger.kernel.org,
	linux-fsdevel@vger.kernel.org, cgroups@vger.kernel.org,
	linux-kselftest@vger.kernel.org, akpm@linux-foundation.org,
	corbet@lwn.net, derek.kiernan@amd.com, dragan.cvetic@amd.com,
	arnd@arndb.de, viro@zeniv.linux.org.uk, brauner@kernel.org,
	jack@suse.cz, tj@kernel.org, hannes@cmpxchg.org, mhocko@kernel.org,
	shakeel.butt@linux.dev, muchun.song@linux.dev,
	Liam.Howlett@oracle.com, lorenzo.stoakes@oracle.com, vbabka@suse.cz,
	jannh@google.com, shuah@kernel.org, vegard.nossum@oracle.com,
	vattunuru@marvell.com, schalla@marvell.com, david@redhat.com,
	willy@infradead.org, osalvador@suse.de, usama.anjum@collabora.com,
	andrii@kernel.org, ryan.roberts@arm.com, peterx@redhat.com,
	oleg@redhat.com, tandersen@netflix.com, rientjes@google.com,
	gthelen@google.com
Subject: Re: [RFCv1 0/6] Page Detective
Message-ID: <ZzzXqXGRlAwk-H2m@google.com>
References: <20241116175922.3265872-1-pasha.tatashin@soleen.com>
 <ZzuRSZc8HX9Zu0dE@google.com>
 <CA+CK2bAAigxUv=HGpxoV-PruN_AhisKW675SxuG_yVi+vNmfSQ@mail.gmail.com>
 <2024111938-anointer-kooky-d4f9@gregkh>
 <CA+CK2bD88y4wmmvzMCC5Zkp4DX5ZrxL+XEOX2v4UhBxet6nwSA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CA+CK2bD88y4wmmvzMCC5Zkp4DX5ZrxL+XEOX2v4UhBxet6nwSA@mail.gmail.com>
X-Migadu-Flow: FLOW_OUT

On Tue, Nov 19, 2024 at 10:08:36AM -0500, Pasha Tatashin wrote:
> On Mon, Nov 18, 2024 at 8:09 PM Greg KH <gregkh@linuxfoundation.org> wrote:
> >
> > On Mon, Nov 18, 2024 at 05:08:42PM -0500, Pasha Tatashin wrote:
> > > Additionally, using crash/drgn is not feasible for us at this time, it
> > > requires keeping external tools on our hosts, also it requires
> > > approval and a security review for each script before deployment in
> > > our fleet.
> >
> > So it's ok to add a totally insecure kernel feature to your fleet
> > instead?  You might want to reconsider that policy decision :)
> 
> Hi Greg,
> 
> While some risk is inherent, we believe the potential for abuse here
> is limited, especially given the existing  CAP_SYS_ADMIN requirement.
> But, even with root access compromised, this tool presents a smaller
> attack surface than alternatives like crash/drgn. It exposes less
> sensitive information, unlike crash/drgn, which could potentially
> allow reading all of kernel memory.

The problem here is with using dmesg for output. No security-sensitive
information should go there. Even exposing raw kernel pointers is not
considered safe.

I'm also not sure about what presents a bigger attack surface. Yes,
drgn allows to read more, but it's using /proc/kcore, so the in-kernel
code is much simpler. But I don't think it's a relevant discussion,
if a malicious user has a root access, there are better options than
both drgn and page detective.

