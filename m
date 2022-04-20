Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 20C7B507C84
	for <lists+linux-doc@lfdr.de>; Wed, 20 Apr 2022 00:28:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1357933AbiDSWbX (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Tue, 19 Apr 2022 18:31:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56044 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1357423AbiDSWbW (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 19 Apr 2022 18:31:22 -0400
Received: from mail-pg1-x535.google.com (mail-pg1-x535.google.com [IPv6:2607:f8b0:4864:20::535])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1BB4C24977
        for <linux-doc@vger.kernel.org>; Tue, 19 Apr 2022 15:28:38 -0700 (PDT)
Received: by mail-pg1-x535.google.com with SMTP id r83so5210674pgr.2
        for <linux-doc@vger.kernel.org>; Tue, 19 Apr 2022 15:28:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=intel-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=+kb4y1ct+D39bV4tAeLvKJMLtfqsTHYQZH4lenFOa/s=;
        b=CwsvcqUQiVh25FI4ZNK8H+0YPMBP3eJ+P3BPK5+aJX86n2oBAuo37ctouTLoufKp3t
         AR0duUflr347GoKa1+yY2PIvjEI7hepl8ldvHjU82VoBYV1IveuNNeT2qS+Bxa7Oe1Qk
         8P1ZsVi1PH1Fo9rBcHc5aVoRhxrRRSjFXZEPV+B3g9mY4z3qe6c8QOAm+cakFYC8IFLs
         OG96Ex2auEffqpTVwkIpTzSM/T7wuEzcktzOJRoL1s2lksufdzd2y9Li1HQkwA1c2jt2
         Ouj1krBuEpKLayRIU49KBi8slX2S3bxXI8AUmsjnbfr87yy/DX4QmrOeVmV/wJMbUjnb
         O94w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=+kb4y1ct+D39bV4tAeLvKJMLtfqsTHYQZH4lenFOa/s=;
        b=Mz6R8Usz6GS4apor7VgHxe+aadIztXQTEeC3nKTNUawoZC8enfscb2awZinaNtxgkn
         uqdmWZ4fQs8oal8Nnrw9O9y5ZFVmcYbEAVXTUfj9LvSjxcBm/ceX5bWV3GH8qBgcsq3j
         CHTjzKnIt5yJeem59Hz25ENVB3adWxAtbkyOSPjkobWx9Tmmso5nsA2dNFfWfoxGSY4j
         qUMgsGJxKQvcjbALCBdBCgmpscuqhf58wS+c3ja2QruzfaObslyd7LRIptBfpCOCVwhe
         3BR9G+KTjAmd1hac/hhLzJY0ZnYeNfyG8KJp27+w/8lq61M0wdB/Q7Yb6MC/GMZ0GgWW
         5UKw==
X-Gm-Message-State: AOAM530g4iDTUa8c4mWsvvkGr865W9ZOqvYpvEMgpSmIksfOArVZVssK
        p+IaleJRPhKsDpdvGDPmQIWYduEAgfznXxlfzBZ9gg==
X-Google-Smtp-Source: ABdhPJy4KNZkUqNaqV9vPC98/sJFh5SHFjYoQr6PyXvPfsPEpn0S6UwD0reKh4DY9t5+K8leyfzLFiBcIRHF+HKJrHs=
X-Received: by 2002:a63:1117:0:b0:399:2df0:7fb9 with SMTP id
 g23-20020a631117000000b003992df07fb9mr17107704pgl.40.1650407317523; Tue, 19
 Apr 2022 15:28:37 -0700 (PDT)
MIME-Version: 1.0
References: <20220407191347.9681-1-jithu.joseph@intel.com> <20220419163859.2228874-1-tony.luck@intel.com>
 <20220419163859.2228874-4-tony.luck@intel.com> <Yl7npfrVTPFEIivC@kroah.com> <CAPcyv4jzscs3Dg4QN0+XHRYdekBeqy1=dRX-mWCj1OXo8jS2vQ@mail.gmail.com>
In-Reply-To: <CAPcyv4jzscs3Dg4QN0+XHRYdekBeqy1=dRX-mWCj1OXo8jS2vQ@mail.gmail.com>
From:   Dan Williams <dan.j.williams@intel.com>
Date:   Tue, 19 Apr 2022 15:28:26 -0700
Message-ID: <CAPcyv4hBGgN=LqY55nf2K4E1OD0n=_axri4CNSKVneStYEp6rw@mail.gmail.com>
Subject: Re: [PATCH v3 03/11] platform/x86/intel/ifs: Create device for Intel
 IFS (In Field Scan)
To:     Greg KH <gregkh@linuxfoundation.org>
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
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, Apr 19, 2022 at 11:09 AM Dan Williams <dan.j.williams@intel.com> wrote:
>
> On Tue, Apr 19, 2022 at 9:48 AM Greg KH <gregkh@linuxfoundation.org> wrote:
> >
> > On Tue, Apr 19, 2022 at 09:38:51AM -0700, Tony Luck wrote:
> > > The initial implementation of IFS is model specific. Enumeration is
> > > via a combination of family-model-stepping and a check for a bit in the
> > > CORE_CAPABILITIES MSR.
> > >
> > > Linux has handled this lack of enumeration before with a code stub to
> > > create a device.  See arch/x86/kernel/pmem.c. Use the same approach
> > > here.
> >
> > Ick, why?  Why not just create a simple virtual device and use that?  Do
> > you really want to bind a driver to this?  Or do you already "know" the
> > only driver that you have will bind to this?
>
> With the realization that there may be multiple instances of an
> IFS-like capability going forward, and that ideally those capabilities
> would move away from a CPU capability bit to an ACPI description, then
> it seemed to me that a simulated platform_device for this is a
> reasonable fit. I.e. when / if an ACPI _HID is assigned for this
> capability the same platform_driver can be reused for those instances.

Turns out the ACPI enumeration for this may not materialize, so this
can indeed move to a simple / driver-less device.
