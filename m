Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BD5C51931D6
	for <lists+linux-doc@lfdr.de>; Wed, 25 Mar 2020 21:21:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727452AbgCYUV1 (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Wed, 25 Mar 2020 16:21:27 -0400
Received: from mail-io1-f67.google.com ([209.85.166.67]:45475 "EHLO
        mail-io1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727316AbgCYUV1 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 25 Mar 2020 16:21:27 -0400
Received: by mail-io1-f67.google.com with SMTP id a24so3090981iol.12
        for <linux-doc@vger.kernel.org>; Wed, 25 Mar 2020 13:21:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=5wcc3fwrS8JnPRZprBTyUdvWc4Xei4mHeogWRJkq6CY=;
        b=I5+h1gu5mhDMyLsqRy+xtMr+jh3nd27e83biTBarZMcqTcDeYgBseua5H+62syFNcz
         nlLeOTcMKcP+UQ2EbWz8mTHCNhnDP8S9ZqOf0YhHJcLvj0NH3V8ewqVrHtdkao934D69
         5oA/ci7plPjM92gm5MPNqF6RpkNkffYZ9AzwOQthDYXjhXl6hUT5ydE4H65F+GjyRpwk
         oZ1W1EFjC8y6ErFvwQHUkdlFoFtHcXD25cothFiX8R+NxsZm+DJf+ZjywXBwd8MlYV1/
         T7MR37EFQzOM2GejOS/cBQj/WDlNZ+pHCHsvSuFH44inNY2/K8Aded6YdR1TnkaEH2Y8
         3f+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=5wcc3fwrS8JnPRZprBTyUdvWc4Xei4mHeogWRJkq6CY=;
        b=FrCQ6HxOoABxzb4c9oiyZUi93S8mt4iM9cyHEAUHELACB503xvUb1JvWyYY+Ep6/LY
         cXVLI7oU8zmTcuYTN28L2k8aiqbdeKymyA2AUVOFULrf1GYtJtI+3wYKOe5+slp0OXUg
         CtMWItJGhhbmF8pU/7FEx+D/V1vJUy85PyoqOWySJry3T9Z2hzyFUNldRnRFOTipbeR/
         IHoNxEs9exLM8MXrXXHk/qlA8XJ+cYAVmycMd7J3BAz9NHb56YYfHKx7giJLi1ljG9d7
         VUo+zy/tdkCJdihxtKfy4HPDlEzBjyu+A5ZL2jaLjU/lpeE+b++oTrNp6oEBcf9FRFIQ
         swMw==
X-Gm-Message-State: ANhLgQ3n7XOmx1AtRO7P1Zg7cyHQYIReqQPxEPSaJUrB6mofm9fhc0Oc
        Crbb8ZdP1IpScmNf15GBLJFRCEKWh4LTtummEe0+2VkYS3Y=
X-Google-Smtp-Source: ADFU+vtJ+fOxLlnspbtL6pwbALF1L9KsGYInL+DB8gtfBgoir8Bj2Q75/B8f/uXkeHCMuhDUMX/RYJB09K2CK7Sutxc=
X-Received: by 2002:a5e:c803:: with SMTP id y3mr4608774iol.82.1585167686234;
 Wed, 25 Mar 2020 13:21:26 -0700 (PDT)
MIME-Version: 1.0
References: <20200325194317.526492-1-ross.philipson@oracle.com> <20200325194317.526492-11-ross.philipson@oracle.com>
In-Reply-To: <20200325194317.526492-11-ross.philipson@oracle.com>
From:   Matthew Garrett <mjg59@google.com>
Date:   Wed, 25 Mar 2020 13:21:14 -0700
Message-ID: <CACdnJuvkrMCbOwqkWUOZunXmu1AwfRpjNp3OAfqR2y0O+OK5Fw@mail.gmail.com>
Subject: Re: [RFC PATCH 10/12] x86: Secure Launch adding event log securityfs
To:     Ross Philipson <ross.philipson@oracle.com>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "the arch/x86 maintainers" <x86@kernel.org>,
        linux-doc@vger.kernel.org, dpsmith@apertussolutions.com,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        "H. Peter Anvin" <hpa@zytor.com>, trenchboot-devel@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, Mar 25, 2020 at 12:43 PM Ross Philipson
<ross.philipson@oracle.com> wrote:
>
> From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
>
> The late init functionality registers securityfs nodes to allow fetching
> of and writing events to the late launch TPM log.

Is there a reason we would want this exposed separately from the
regular event log, rather than just appending it there?

> +static ssize_t sl_evtlog_write(struct file *file, const char __user *buf,
> +                               size_t datalen, loff_t *ppos)
> +{

What's expected to be writing to this?
