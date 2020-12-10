Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 761D72D590A
	for <lists+linux-doc@lfdr.de>; Thu, 10 Dec 2020 12:15:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729342AbgLJLNX (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Thu, 10 Dec 2020 06:13:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58522 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389335AbgLJLNP (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 10 Dec 2020 06:13:15 -0500
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com [IPv6:2a00:1450:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6BE2DC061794;
        Thu, 10 Dec 2020 03:12:29 -0800 (PST)
Received: by mail-wr1-x442.google.com with SMTP id w5so1298723wrm.11;
        Thu, 10 Dec 2020 03:12:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=SFeiWCONYDarnfPLxLW1GxMdDbdLJCJ6938SVXgGsFI=;
        b=Wow/eRHQYpgpieT0j7r5lB7tKLAF3Tt+hJrpqcDSjFfJYz20LQ+diyhM0ZVnoAV9Nz
         svMA/XHdPDg8QxFV7PEhxcfGReeiEUgPmb6pU1I1ghxf8TC4oO9RX5bxUeyUT62VV2g0
         MeA7PgP7E8mVqaNtxIkF0buWLHLP6fzp+U5bmL1E9RpYX20V4VyXERi5UtldErmgtGvV
         dA8ejSMjV7XL1am3sNk9btBuXWkGKGBKSiji43Y1XMqmrNGgndSZPFyvJjgcfgasHHWL
         Rlb/zOfsBBsnfG0VU6XfAmWkLV/oUt4TmMgNJtZuBTJ0Rdqro8xMF7XQV3L0YuCIe/yu
         7I1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=SFeiWCONYDarnfPLxLW1GxMdDbdLJCJ6938SVXgGsFI=;
        b=Q0wN6Y+tbNbwTuazWTHzPUu5wNys2X34/y31rHEYApeV79pjLI/iDBxORKjUKrXKS6
         D5X/G5mws6I+NSNIAxxWixZitnv9/9i1AsaXsBBDlVBmKfOViSJKpURusZOrgcdoi4Hy
         049tj8fiPAVncf7qXLvkO1JUgSPG9d9v2R0A0SrwNBG5gWEiWw9UjM5kzK1fjIeoq1Kq
         nPSQxmq5uCpzjUbHBPVGdSRxFyYILxixbkCahUVWKxHZMxqMBW5ekNru2WUt+z+0d0+a
         rKnZ3Q6ya0iIJRs+RiNH4CVMfgkwyOgPVRyGtVoJK2HrfdMPQu+xg1Vzofl1oLvykdTK
         KbYw==
X-Gm-Message-State: AOAM532FQYeCvEk1HsuVvpDe/2VHkjXzHFIbqvw/iyA/+lMpwbl1EzbQ
        76YKT54kWwp8kzECDkRpJP0=
X-Google-Smtp-Source: ABdhPJzmUHxiHT9O8COe36dsoLI4lCjNl/sTysqpXIA40FtgJDXGCipLSbimOGA6HLH+fnpPFq/+6A==
X-Received: by 2002:adf:f146:: with SMTP id y6mr7778814wro.298.1607598748151;
        Thu, 10 Dec 2020 03:12:28 -0800 (PST)
Received: from smtp.gmail.com (a95-92-181-29.cpe.netcabo.pt. [95.92.181.29])
        by smtp.gmail.com with ESMTPSA id r2sm8799281wrn.83.2020.12.10.03.12.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Dec 2020 03:12:27 -0800 (PST)
Date:   Thu, 10 Dec 2020 08:12:21 -0300
From:   Melissa Wen <melissa.srw@gmail.com>
To:     Sumera Priyadarsini <sylphrenadin@gmail.com>,
        hamohammed.sa@gmail.com, rodrigosiqueiramelo@gmail.com,
        airlied@linux.ie, mripard@kernel.org,
        maarten.lankhorst@linux.intel.com, tzimmermann@suse.de,
        corbet@lwn.net, dri-devel@lists.freedesktop.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] drm/vkms: Add setup and testing information
Message-ID: <20201210111221.evhku6xjhgxmu4ys@smtp.gmail.com>
References: <20201209190453.c6kp5winikr55n3i@adolin>
 <20201209221711.GC401619@phenom.ffwll.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201209221711.GC401619@phenom.ffwll.local>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 12/09, Daniel Vetter wrote:
> On Thu, Dec 10, 2020 at 12:34:53AM +0530, Sumera Priyadarsini wrote:
> > Update the vkms documentation to contain steps to:
> > 
> >  - setup the vkms driver
> >  - run tests using igt
> > 
> > Signed-off-by: Sumera Priyadarsini <sylphrenadin@gmail.com>
> > ___
> > Changes in v2:
> >  - Change heading to title case (Daniel)
> >  - Add examples to run tests directly (Daniel)
> >  - Add examples to run subtests (Melissa)
> > 
> > Changes in v3:
> >  - Add example using run-tests.sh script(Daniel)
> 
> Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
> 
Applied to drm-misc-next.

Thanks for these improvements,

Melissa
> > ---
> >  Documentation/gpu/vkms.rst | 70 ++++++++++++++++++++++++++++++++++++++
> >  1 file changed, 70 insertions(+)
> > 
> > diff --git a/Documentation/gpu/vkms.rst b/Documentation/gpu/vkms.rst
> > index 13bab1d93bb3..9e030c74a82e 100644
> > --- a/Documentation/gpu/vkms.rst
> > +++ b/Documentation/gpu/vkms.rst
> > @@ -7,6 +7,76 @@
> >  .. kernel-doc:: drivers/gpu/drm/vkms/vkms_drv.c
> >     :doc: vkms (Virtual Kernel Modesetting)
> >  
> > +Setup
> > +=====
> > +
> > +The VKMS driver can be setup with the following steps:
> > +
> > +To check if VKMS is loaded, run::
> > +
> > +  lsmod | grep vkms
> > +
> > +This should list the VKMS driver. If no output is obtained, then
> > +you need to enable and/or load the VKMS driver.
> > +Ensure that the VKMS driver has been set as a loadable module in your
> > +kernel config file. Do::
> > +
> > +  make nconfig
> > +
> > +  Go to `Device Drivers> Graphics support`
> > +
> > +  Enable `Virtual KMS (EXPERIMENTAL)`
> > +
> > +Compile and build the kernel for the changes to get reflected.
> > +Now, to load the driver, use::
> > +
> > +  sudo modprobe vkms
> > +
> > +On running the lsmod command now, the VKMS driver will appear listed.
> > +You can also observe the driver being loaded in the dmesg logs.
> > +
> > +To disable the driver, use ::
> > +
> > +  sudo modprobe -r vkms
> > +
> > +Testing With IGT
> > +================
> > +
> > +The IGT GPU Tools is a test suite used specifically for debugging and
> > +development of the DRM drivers.
> > +The IGT Tools can be installed from
> > +`here <https://gitlab.freedesktop.org/drm/igt-gpu-tools>`_ .
> > +
> > +The tests need to be run without a compositor, so you need to switch to text
> > +only mode. You can do this by::
> > +
> > +  sudo systemctl isolate multi-user.target
> > +
> > +To return to graphical mode, do::
> > +
> > +  sudo systemctl isolate graphical.target
> > +
> > +Once you are in text only mode, you can run tests using the --device switch
> > +or IGT_DEVICE variable to specify the device filter for the driver we want
> > +to test. IGT_DEVICE can also be used with the run-test.sh script to run the
> > +tests for a specific driver::
> > +
> > +  sudo ./build/tests/<name of test> --device "sys:/sys/devices/platform/vkms"
> > +  sudo IGT_DEVICE="sys:/sys/devices/platform/vkms" ./build/tests/<name of test>
> > +  sudo IGT_DEVICE="sys:/sys/devices/platform/vkms" ./scripts/run-tests.sh -t <name of test>
> > +
> > +For example, to test the functionality of the writeback library,
> > +we can run the kms_writeback test::
> > +
> > +  sudo ./build/tests/kms_writeback --device "sys:/sys/devices/platform/vkms"
> > +  sudo IGT_DEVICE="sys:/sys/devices/platform/vkms" ./build/tests/kms_writeback
> > +  sudo IGT_DEVICE="sys:/sys/devices/platform/vkms" ./scripts/run-tests.sh -t kms_writeback
> > +
> > +You can also run subtests if you do not want to run the entire test::
> > +
> > +  sudo ./build/tests/kms_flip --run-subtest basic-plain-flip --device "sys:/sys/devices/platform/vkms"
> > +  sudo IGT_DEVICE="sys:/sys/devices/platform/vkms" ./build/tests/kms_flip --run-subtest basic-plain-flip
> > +
> >  TODO
> >  ====
> >  
> > -- 
> > 2.25.1
> > 
> 
> -- 
> Daniel Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch
