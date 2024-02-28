Return-Path: <linux-doc+bounces-10972-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E3AF86A8BE
	for <lists+linux-doc@lfdr.de>; Wed, 28 Feb 2024 08:15:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1BB2C28A115
	for <lists+linux-doc@lfdr.de>; Wed, 28 Feb 2024 07:15:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3730823769;
	Wed, 28 Feb 2024 07:15:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fz47KIXv"
X-Original-To: linux-doc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D68C722EF0;
	Wed, 28 Feb 2024 07:15:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709104503; cv=none; b=khswgFs/MwRjypPbu8dHljOSWn5U14IrABy/uG78bQ8mA00cD28GIYbtpSpBU4Gg0K8mcXcsUapeHX2pom3J6j6MKlOta61rAhc45GtsAG6arKu+AHPlCgQJAfW7PFq0ejHILCBw9C/FM8D5qXHO9p+zbJmtWFoUE/97vtCMEkI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709104503; c=relaxed/simple;
	bh=1gglbZIP1dlhyVEj/0RVeL/8j5qVaiNlDxPsZ0gsr8A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sywW3lUIOt8hNB0dNsAHrjWpcPSSCq+zRz2YnDxYZ5EuRltjk4NT82dj9C3gPEdCGF1ZVdOPdauODuQKxIB4LAx3qO5Qg28QTLspWJEffZ2a4sAgFNtOHdjusJNChS71bW8tYEYcgxzWgYm6mpwtbxuWGcusswYtKy43qt3cbZg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fz47KIXv; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709104501; x=1740640501;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=1gglbZIP1dlhyVEj/0RVeL/8j5qVaiNlDxPsZ0gsr8A=;
  b=fz47KIXv15CWMR/WX5jktDDBRi5neldVIVK9VVfLmvRNepba+Pr9850s
   xMYoMegkbHdCwMshUVb5gAk/NF3YNiJ33iODKFvav83kqU+t8z1oTZfBk
   /QWk8xebmNalSDVR8NFqwO3sxwIylrKpeFQ4Ri3ev1YZaOHrIDfcQ1O9M
   ZAluGcXz8m/rV7bHmaplDqoT41mNArC84pbDJfZ2M3OxEqZuPIfHBJRpc
   7jeSKRG/mhUis/2Df1aRgV3Ym3XXA9zQnLKaXAcIhwI9Auf9Ng9wpOsac
   B3BP7zaZYqkA5L+tTVYjYrHRKO0rLx/UA5Gq5/DRecU3jil/a/ikzYpYo
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10996"; a="28921389"
X-IronPort-AV: E=Sophos;i="6.06,190,1705392000"; 
   d="scan'208";a="28921389"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa101.fm.intel.com with ESMTP; 27 Feb 2024 23:15:00 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,190,1705392000"; 
   d="scan'208";a="11895371"
Received: from yilunxu-optiplex-7050.sh.intel.com (HELO localhost) ([10.239.159.165])
  by fmviesa005.fm.intel.com with ESMTP; 27 Feb 2024 23:14:57 -0800
Date: Wed, 28 Feb 2024 15:10:53 +0800
From: Xu Yilun <yilun.xu@linux.intel.com>
To: Marco Pagani <marpagan@redhat.com>
Cc: Moritz Fischer <mdf@kernel.org>, Wu Hao <hao.wu@intel.com>,
	Xu Yilun <yilun.xu@intel.com>, Tom Rix <trix@redhat.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Alan Tull <atull@opensource.altera.com>,
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-fpga@vger.kernel.org
Subject: Re: [RFC PATCH v5 1/1] fpga: add an owner and use it to take the
 low-level module's refcount
Message-ID: <Zd7cff43ffbJOGNY@yilunxu-OptiPlex-7050>
References: <20240111160242.149265-1-marpagan@redhat.com>
 <20240111160242.149265-2-marpagan@redhat.com>
 <Zbh7iO9wlm9ekzB7@yilunxu-OptiPlex-7050>
 <0720eb91-72f9-4781-8558-8a1b0a3691c2@redhat.com>
 <Zb8dd9af0Ru/fzGi@yilunxu-OptiPlex-7050>
 <4aaa131a-4b64-4b86-9548-68aef63c87b3@redhat.com>
 <ZdHWaeU+/On6LmHX@yilunxu-OptiPlex-7050>
 <9a9d4018-fd65-49be-9e0a-1eecc9cbf15d@redhat.com>
 <ZdYKnZxdTCvu5THG@yilunxu-OptiPlex-7050>
 <ae3cd81b-82af-4977-91d7-fa809c6fc45a@redhat.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ae3cd81b-82af-4977-91d7-fa809c6fc45a@redhat.com>

On Tue, Feb 27, 2024 at 12:49:06PM +0100, Marco Pagani wrote:
> 
> 
> On 2024-02-21 15:37, Xu Yilun wrote:
> > On Tue, Feb 20, 2024 at 12:11:26PM +0100, Marco Pagani wrote:
> >>
> >>
> >> On 2024-02-18 11:05, Xu Yilun wrote:
> >>> On Mon, Feb 05, 2024 at 06:47:34PM +0100, Marco Pagani wrote:
> >>>>
> >>>>
> >>>> On 2024-02-04 06:15, Xu Yilun wrote:
> >>>>> On Fri, Feb 02, 2024 at 06:44:01PM +0100, Marco Pagani wrote:
> >>>>>>
> >>>>>>
> >>>>>> On 2024-01-30 05:31, Xu Yilun wrote:
> >>>>>>>> +#define fpga_mgr_register_full(parent, info) \
> >>>>>>>> +	__fpga_mgr_register_full(parent, info, THIS_MODULE)
> >>>>>>>>  struct fpga_manager *
> >>>>>>>> -fpga_mgr_register_full(struct device *parent, const struct fpga_manager_info *info);
> >>>>>>>> +__fpga_mgr_register_full(struct device *parent, const struct fpga_manager_info *info,
> >>>>>>>> +			 struct module *owner);
> >>>>>>>>  
> >>>>>>>> +#define fpga_mgr_register(parent, name, mops, priv) \
> >>>>>>>> +	__fpga_mgr_register(parent, name, mops, priv, THIS_MODULE)
> >>>>>>>>  struct fpga_manager *
> >>>>>>>> -fpga_mgr_register(struct device *parent, const char *name,
> >>>>>>>> -		  const struct fpga_manager_ops *mops, void *priv);
> >>>>>>>> +__fpga_mgr_register(struct device *parent, const char *name,
> >>>>>>>> +		    const struct fpga_manager_ops *mops, void *priv, struct module *owner);
> >>>>>>>> +
> >>>>>>>>  void fpga_mgr_unregister(struct fpga_manager *mgr);
> >>>>>>>>  
> >>>>>>>> +#define devm_fpga_mgr_register_full(parent, info) \
> >>>>>>>> +	__devm_fpga_mgr_register_full(parent, info, THIS_MODULE)
> >>>>>>>>  struct fpga_manager *
> >>>>>>>> -devm_fpga_mgr_register_full(struct device *parent, const struct fpga_manager_info *info);
> >>>>>>>> +__devm_fpga_mgr_register_full(struct device *parent, const struct fpga_manager_info *info,
> >>>>>>>> +			      struct module *owner);
> >>>>>>>
> >>>>>>> Add a line here. I can do it myself if you agree.
> >>>>>>
> >>>>>> Sure, that is fine by me. I also spotted a typo in the commit log body
> >>>>>> (in taken -> is taken). Do you want me to send a v6, or do you prefer
> >>>>>> to fix that in place?
> >>>>>
> >>>>> No need, I can fix it.
> >>>>>
> >>>>>>
> >>>>>>>
> >>>>>>> There is still a RFC prefix for this patch. Are you ready to get it merged?
> >>>>>>> If yes, Acked-by: Xu Yilun <yilun.xu@intel.com>
> >>>>>>
> >>>>>> I'm ready for the patch to be merged. However, I recently sent an RFC
> >>>>>> to propose a safer implementation of try_module_get() that would
> >>>>>> simplify the code and may also benefit other subsystems. What do you
> >>>>>> think?
> >>>>>>
> >>>>>> https://lore.kernel.org/linux-modules/20240130193614.49772-1-marpagan@redhat.com/
> >>>>>
> >>>>> I suggest take your fix to linux-fpga/for-next now. If your try_module_get()
> >>>>> proposal is applied before the end of this cycle, we could re-evaluate
> >>>>> this patch.
> >>>>
> >>>> That's fine by me.
> >>>
> >>> Sorry, I still found issues about this solution.
> >>>
> >>> void fpga_mgr_unregister(struct fpga_manager *mgr)
> >>> {
> >>>         dev_info(&mgr->dev, "%s %s\n", __func__, mgr->name);
> >>>
> >>>         /*
> >>>          * If the low level driver provides a method for putting fpga into
> >>>          * a desired state upon unregister, do it.
> >>>          */
> >>>         fpga_mgr_fpga_remove(mgr);
> >>>
> >>>         mutex_lock(&mgr->mops_mutex);
> >>>
> >>>         mgr->mops = NULL;
> >>>
> >>>         mutex_unlock(&mgr->mops_mutex);
> >>>
> >>>         device_unregister(&mgr->dev);
> >>> }
> >>>
> >>> Note that fpga_mgr_unregister() doesn't have to be called in module_exit().
> >>> So if we do fpga_mgr_get() then fpga_mgr_unregister(), We finally had a
> >>> fpga_manager dev without mops, this is not what the user want and cause
> >>> problem when using this fpga_manager dev for other FPGA APIs.
> >>
> >> How about moving mgr->mops = NULL from fpga_mgr_unregister() to
> >> class->dev_release()? In that way, mops will be set to NULL only when the
> >> manager dev refcount reaches 0.
> > 
> > I'm afraid it doesn't help.  The lifecycle of the module and the fpga
> > mgr dev is different.
> > 
> > We use mops = NULL to indicate module has been freed or will be freed in no
> > time.  On the other hand mops != NULL means module is still there, so
> > that try_module_get() could be safely called.  It is possible someone
> > has got fpga mgr dev but not the module yet, at that time the module is
> > unloaded, then try_module_get() triggers crash.
> > 
> >>
> >> If fpga_mgr_unregister() is called from module_exit(), we are sure that nobody
> >> got the manager dev earlier using fpga_mgr_get(), or it would have bumped up
> > 
> > No, someone may get the manager dev but not the module yet, and been
> > scheduled out.
> >
> 
> You are right. Overall, it's a bad idea. How about then using an additional 
> bool flag instead of "overloading" the mops pointer? Something like:
> 
> get:
> 	if (!mgr->owner_valid || !try_module_get(mgr->mops_owner))
> 
> remove:
> 	mgr->owner_valid = false;

I'm not quite sure which function is actually mentioned by "remove".  I
assume it should be fpga_mgr_unregister().  IIUC this flag means no
more reference to fpga mgr, but existing references are still valid.

It works for me. But the name of this flag could be reconsidered to
avoid misunderstanding.  The owner is still valid (we still need to put
the owner) but allows no more reference.  Maybe "owner_inactive"?

I still wanna this owner reference change been splitted, so that
we could simply revert it when the try_module_get_safe() got accepted.

Thanks,
Yilun

> 
> Another possibility that comes to my mind would be to "overload" the owner
> pointer itself by using the ERR_PTR/IS_ERR macros. However, it looks ugly
> to me.
> 
> Thanks,
> Marco
> 
> 
> [...]
> 

