Return-Path: <linux-doc+bounces-20595-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 21BF692FE91
	for <lists+linux-doc@lfdr.de>; Fri, 12 Jul 2024 18:29:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 940C4B21E37
	for <lists+linux-doc@lfdr.de>; Fri, 12 Jul 2024 16:29:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3BD9E176221;
	Fri, 12 Jul 2024 16:29:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cmpxchg-org.20230601.gappssmtp.com header.i=@cmpxchg-org.20230601.gappssmtp.com header.b="e7kCsagV"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0630716191E
	for <linux-doc@vger.kernel.org>; Fri, 12 Jul 2024 16:29:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720801769; cv=none; b=Jr7b3XYCo7Vi6OJhQTfZeZgpdwVXPpnk7F8ObJnyG408IySuKUbVO4WqZ4rhwFH0FM6g3dq67e9abztYBMy3FcZlZdFIZC/xFOt9CM0yKK14yFRiqUNfEwEuQiWN1a5o2lFy682aVvjhtLAPYCpxAofb6E+F1lJAIaPNC6Ka3Hc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720801769; c=relaxed/simple;
	bh=XbSdaKc1cJ9dWqsVpCi2A+WgOjxCeAzqKqXAasUBPhI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DTOmRGi84/Dp0DLK2tQIMFMsxknr3RMYGdWFtNsbLVZ0ypA+ZR+ANdbZLCgc6Y50e/4PA2zKDPnvMJPfp9L74TP+MaG9D0G6Okq6m7uaeHxc//xifxikCG569yz6s6b2ZDq+Pzyl8B0YawVdSY0RT4IgBoOKLjGKZhzqNEZQKGs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmpxchg.org; spf=pass smtp.mailfrom=cmpxchg.org; dkim=pass (2048-bit key) header.d=cmpxchg-org.20230601.gappssmtp.com header.i=@cmpxchg-org.20230601.gappssmtp.com header.b=e7kCsagV; arc=none smtp.client-ip=209.85.160.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmpxchg.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmpxchg.org
Received: by mail-qt1-f178.google.com with SMTP id d75a77b69052e-44c2c4ccb7aso21805231cf.1
        for <linux-doc@vger.kernel.org>; Fri, 12 Jul 2024 09:29:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cmpxchg-org.20230601.gappssmtp.com; s=20230601; t=1720801766; x=1721406566; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=l2Ufd6APduh/kxK4VGqW6tCjnor6ESfLTeT8s0Xnis4=;
        b=e7kCsagVt04OH5MSpySGNP3ThXIsBQfGvTiWeh+BAzx9QD/oAZxOP/9bQrGDH6rNSt
         aRRwu7aWouiQfbZ2Dcax0+hU9gT8LSd34iCkYRZSL00zrs5q/R+iMHMAlmXM6wtw3G/I
         WgVkz0XK17l4C0tSo40jaestXL+Ej7HqFiMtxYIrTDdJHdpc8b2Bn8IOilRFbJZJsZeR
         xypuv9ZoZ32yW0oNPDvhr5T+ECDLY8mxkU2xkcfPgxJ/zCv7LZ8dcHsXoXarnFwAVvx7
         Q30xLI7CRBmsM5xjV1LIyQjCt7laeGsVYhloTxfUQ/fXZn5S++mMF9ppoH3ZjEPOO4kS
         e0yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720801766; x=1721406566;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l2Ufd6APduh/kxK4VGqW6tCjnor6ESfLTeT8s0Xnis4=;
        b=Fh1ruGgRs86CcgtE4dKmVTDyV9dS8BrmnHKCCRFI7NUgxtRjg8p6M/I8ZtIijfMM7q
         NxE/SRPv4lNvPYi3CY+qh4x2PIW4lP1kOLtS53MgYLOv9xyWc2EMVovde3jcQ/uOByPt
         aBZQjMJTmyBDgVKoApoaTYbaxhvijxlEGq5cW9jZ+qLklitVS8V0ki8ZNE2zHpx886Mc
         JNKTnlw6Cd6iEZTDBfYO2U3zYjW4x3MCAQ5qlRs8q5HyKGcsb8xASODFEW68oK5lDpwJ
         oQMHpoUHxNCYrl7BRm27TPDICPQVjBmOyuF3LCyW1aIriNmf0Pvm7S4aHbtkZIxjXRUM
         uF/Q==
X-Forwarded-Encrypted: i=1; AJvYcCVfICLh7BDP0S0/Z43wz+ApcDWJ+soRcCjc1kWCbn7HPu8hCfbqS+Dz51/nXcNmWLOACMqMEHYvDOHxIwr9DT5Y6wM6yVgkdwCz
X-Gm-Message-State: AOJu0Ywb5KFBkrzUxchmLc0xkJbCXlrKUUOx6mxBgkVQCVn8Zf4FAmKK
	CTM1PoKQPjKQAlujL3Modzn1oebL2wcsyT4tUjtLjeMHmec269OUnFDSS/48cCE=
X-Google-Smtp-Source: AGHT+IFHYmzA9N0Yd0Tc+kdQ+Zph861+tOpWycqumbkwpucMFfeAe/DCkmkoZFdmjnb3OHRBfPPrXQ==
X-Received: by 2002:ac8:59c6:0:b0:447:f1f9:7154 with SMTP id d75a77b69052e-44e56416176mr57425631cf.11.1720801765810;
        Fri, 12 Jul 2024 09:29:25 -0700 (PDT)
Received: from localhost ([2603:7000:c01:2716:da5e:d3ff:fee7:26e7])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-447f9bfb65csm42042801cf.92.2024.07.12.09.29.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jul 2024 09:29:25 -0700 (PDT)
Date: Fri, 12 Jul 2024 12:29:20 -0400
From: Johannes Weiner <hannes@cmpxchg.org>
To: Waiman Long <longman@redhat.com>
Cc: Tejun Heo <tj@kernel.org>, Zefan Li <lizefan.x@bytedance.com>,
	Jonathan Corbet <corbet@lwn.net>, cgroups@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	Kamalesh Babulal <kamalesh.babulal@oracle.com>,
	Roman Gushchin <roman.gushchin@linux.dev>
Subject: Re: [PATCH v3 1/2] cgroup: Show # of subsystem CSSes in cgroup.stat
Message-ID: <20240712162920.GA1321673@cmpxchg.org>
References: <20240711134927.GB456706@cmpxchg.org>
 <4e1078d6-6970-4eea-8f73-56a3815794b5@redhat.com>
 <ZpAT_xu0oXjQsKM7@slm.duckdns.org>
 <76e70789-986a-44c2-bfdc-d636f425e5ae@redhat.com>
 <ZpAoD7_o8bf6yVGr@slm.duckdns.org>
 <e5348a85-22eb-48a6-876d-3180de5c7171@redhat.com>
 <ZpArhD49OonR6Oz6@slm.duckdns.org>
 <c54651db-1a06-49f6-aea7-02768ad70756@redhat.com>
 <20240711195946.GA1094169@cmpxchg.org>
 <e42f41af-e8a9-4544-9194-003d6b0f0ba8@redhat.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e42f41af-e8a9-4544-9194-003d6b0f0ba8@redhat.com>

On Thu, Jul 11, 2024 at 05:00:41PM -0400, Waiman Long wrote:
> On 7/11/24 15:59, Johannes Weiner wrote:
> > On Thu, Jul 11, 2024 at 03:13:12PM -0400, Waiman Long wrote:
> >> On 7/11/24 14:59, Tejun Heo wrote:
> >>> On Thu, Jul 11, 2024 at 02:51:38PM -0400, Waiman Long wrote:
> >>>> On 7/11/24 14:44, Tejun Heo wrote:
> >>>>> Hello,
> >>>>>
> >>>>> On Thu, Jul 11, 2024 at 01:39:38PM -0400, Waiman Long wrote:
> >>>>>> On 7/11/24 13:18, Tejun Heo wrote:
> >>>>> ...
> >>>>>> Currently, I use the for_each_css() macro for iteration. If you mean
> >>>>>> displaying all the possible cgroup subsystems even if they are not enabled
> >>>>>> for the current cgroup, I will have to manually do the iteration.
> >>>>> Just wrapping it with for_each_subsys() should do, no? for_each_css() won't
> >>>>> iterate anything if css doesn't exist for the cgroup.
> >>>> OK, I wasn't sure if you were asking to list all the possible cgroup v2
> >>>> cgroup subsystems even if they weren't enabled in the current cgroup.
> >>>> Apparently, that is the case. I prefer it that way too.
> >>> Yeah, I think listing all is better. If the list corresponded directly to
> >>> cgroup.controllers, it may make sense to only show enabled ones but we can
> >>> have dying ones and implicitly enabled memory and so on, so I think it'd be
> >>> cleaner to just list them all.
> >> That will means cgroup subsystems that are seldomly used like rdma, misc
> >> or even hugetlb will always be shown in all the cgroup.stat output. I
> >> actually prefer just showing those that are enabled. As for dying memory
> >> cgroups, they will only be shown in its online ancestors. We currently
> >> don't know how many level down are each of the dying ones.
> > It seems odd to me to not show dead ones after a cgroup has disabled
> > the controller again. They still consume memory, after all, and so
> > continue to be property of that cgroup afterwards.
> >
> > Instead of doing for_each_css(), would it make more sense to have
> >
> > 	struct cgroup {
> > 		...
> > 		int nr_dying_subsys[CGROUP_SUBSYS_COUNT];
> 
> What exactly does new this array for?

For keeping the counts. Instead of inside the css.

AFAICS, with your current patch, if somebody were to disable the
controller in cgroup.subtree_control, it would offline the css at that
level, become unreachable from cgroup->subsys[], and you'd lose
remaining counts of dead css that are still associated with that
cgroup. Re-enabling the controller would create a new css with new
descendant counts, and now the reported numbers are actively misleading.

That seems undesirable.

If you track the counts in the cgroup itself, then cgroup.stat would
reliably show the total counts of dead controllers that are associated
with the subtree, even after disabling or toggling controllers.

The hooks in online, offline, release should be the same, just update
css->cgroup->nr_dying_subsys[id] instead of css->nr_dying_descendants.

