Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 100AF5082A3
	for <lists+linux-doc@lfdr.de>; Wed, 20 Apr 2022 09:49:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344870AbiDTHwC (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Wed, 20 Apr 2022 03:52:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46652 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235722AbiDTHwC (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 20 Apr 2022 03:52:02 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0B92B340E0;
        Wed, 20 Apr 2022 00:49:17 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 96CBC61902;
        Wed, 20 Apr 2022 07:49:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2EC32C385A1;
        Wed, 20 Apr 2022 07:49:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1650440955;
        bh=f//ddCb1kg1OUp3nBiyVRIMPPYnTIOUqEVT0YxYxFNY=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=pOlkMTGMogFALyUhAiodmRVJkTER+iPBmeuHteiMlxC8bXyAVLZqqCgaYPtpflvTC
         QS4Kd3pUP+RF7B2cyWw9fMkwf9ZqW8ZFLqE9m4BhKpFgQKwFpwNhzu42stTQdbacpX
         BRqOhbJ7X2mZ1wjgYIBxU59iBp4C8mUKdyJFZIKk=
Date:   Wed, 20 Apr 2022 09:49:13 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Dan Williams <dan.j.williams@intel.com>
Cc:     Tony Luck <tony.luck@intel.com>,
        Hans de Goede <hdegoede@redhat.com>, markgross@kernel.org,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        X86 ML <x86@kernel.org>, "H. Peter Anvin" <hpa@zytor.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        "Joseph, Jithu" <jithu.joseph@intel.com>,
        "Raj, Ashok" <ashok.raj@intel.com>,
        Steven Rostedt <rostedt@goodmis.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        platform-driver-x86@vger.kernel.org, patches@lists.linux.dev,
        Ravi V Shankar <ravi.v.shankar@intel.com>
Subject: Re: [PATCH v3 03/11] platform/x86/intel/ifs: Create device for Intel
 IFS (In Field Scan)
Message-ID: <Yl+6+fhMkAj1Jn0p@kroah.com>
References: <20220407191347.9681-1-jithu.joseph@intel.com>
 <20220419163859.2228874-1-tony.luck@intel.com>
 <20220419163859.2228874-4-tony.luck@intel.com>
 <Yl7npfrVTPFEIivC@kroah.com>
 <CAPcyv4jzscs3Dg4QN0+XHRYdekBeqy1=dRX-mWCj1OXo8jS2vQ@mail.gmail.com>
 <CAPcyv4hBGgN=LqY55nf2K4E1OD0n=_axri4CNSKVneStYEp6rw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAPcyv4hBGgN=LqY55nf2K4E1OD0n=_axri4CNSKVneStYEp6rw@mail.gmail.com>
X-Spam-Status: No, score=-7.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, Apr 19, 2022 at 03:28:26PM -0700, Dan Williams wrote:
> On Tue, Apr 19, 2022 at 11:09 AM Dan Williams <dan.j.williams@intel.com> wrote:
> >
> > On Tue, Apr 19, 2022 at 9:48 AM Greg KH <gregkh@linuxfoundation.org> wrote:
> > >
> > > On Tue, Apr 19, 2022 at 09:38:51AM -0700, Tony Luck wrote:
> > > > The initial implementation of IFS is model specific. Enumeration is
> > > > via a combination of family-model-stepping and a check for a bit in the
> > > > CORE_CAPABILITIES MSR.
> > > >
> > > > Linux has handled this lack of enumeration before with a code stub to
> > > > create a device.  See arch/x86/kernel/pmem.c. Use the same approach
> > > > here.
> > >
> > > Ick, why?  Why not just create a simple virtual device and use that?  Do
> > > you really want to bind a driver to this?  Or do you already "know" the
> > > only driver that you have will bind to this?
> >
> > With the realization that there may be multiple instances of an
> > IFS-like capability going forward, and that ideally those capabilities
> > would move away from a CPU capability bit to an ACPI description, then
> > it seemed to me that a simulated platform_device for this is a
> > reasonable fit. I.e. when / if an ACPI _HID is assigned for this
> > capability the same platform_driver can be reused for those instances.
> 
> Turns out the ACPI enumeration for this may not materialize, so this
> can indeed move to a simple / driver-less device.

Hey, see, doing extra work now was not a good idea :)
