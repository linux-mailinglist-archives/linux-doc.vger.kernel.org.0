Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 70EB345ABB
	for <lists+linux-doc@lfdr.de>; Fri, 14 Jun 2019 12:41:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727065AbfFNKlY (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Fri, 14 Jun 2019 06:41:24 -0400
Received: from mail-lj1-f193.google.com ([209.85.208.193]:38120 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727058AbfFNKlY (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 14 Jun 2019 06:41:24 -0400
Received: by mail-lj1-f193.google.com with SMTP id r9so1893636ljg.5
        for <linux-doc@vger.kernel.org>; Fri, 14 Jun 2019 03:41:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Q33161EtMzRSB6VIWTElwTgQtwrlUyXLxdZciZIKhi8=;
        b=jIpgKCJerBDe2V4KyNw1PzAyvMlwzXdVZZ/0qiOJ+ppmelSNktDNri1MNI0Y2Ch71G
         mxFrhZIgIqvzYXU8lgYP5McpKQW4Eq0q3WBNfNbIkkaSmNBMZ/1qDeDxEeC9t8OUQ3DQ
         Z4gudg15cOXpH18Q2PkjJZXJU9aTCelom3XWX5gP4ghGSZ34f8awNWsDBnJdRUABtfXn
         6POTD0TnE3lYawWMv7IwoYujxZavUThZ4v7t8lys1wvQq6I5c3KQGtkECF6ZTUw8O4DG
         7VuqlX0FqLTmsyziFiGJzRAhWTIwlaTV+rn7UAsxeTODuq/dHsWuTL+E+UCLPREEmQ0r
         Sdew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Q33161EtMzRSB6VIWTElwTgQtwrlUyXLxdZciZIKhi8=;
        b=NV+PeRAoCjiRdNPAnEL3rA3db1dJF0FRrT2XMswyXtdTueWjTdvoT4OdkX0OZ7NPf8
         DXpaPIOMRNM5B1Pn52H/M84Sou9qmydnZ9ZkcJlDb47W7N2IRjwKJQefhQ0BX48QLIgG
         qP+H2r6JXx81dz9JfUR9FfEpZcuGAcizp3vPCShFK4uY7sno3Y4ZaSFSufZ8H8jjbZs0
         a91ZPiu39cRv6dqLBiZOxF8Ll7jx6E105UjnVmYrlB6X52jNq5jgbygP+bFEmsU5VN+D
         ye45HoM1UDgtkUySmk39z1kZkn8PCVHbBYdFEmbjwWWQbnb0plpuNaeCLR0+KczcAsC1
         Mcvg==
X-Gm-Message-State: APjAAAW5zrgmri/h+L2S7KUzA0EVRdIJatGqEQ3+JEJUQFWFj8+7Q7IA
        NoJr9Nkd3uxW/L1qaZ7ZTFeTrpDCkcEx0xHW19i0NKynvh0=
X-Google-Smtp-Source: APXvYqzz3hC4g88mZXFl5KkW+vdX+JqbwcLZsw2FXVeTt/9DrVzfPuH8CdNqbnVijTm32ZWG8sVUDH5Md8as+XqBggQ=
X-Received: by 2002:a2e:63d9:: with SMTP id s86mr38515728lje.92.1560508882540;
 Fri, 14 Jun 2019 03:41:22 -0700 (PDT)
MIME-Version: 1.0
References: <20190530152758.16628-1-sashal@kernel.org> <20190530152758.16628-2-sashal@kernel.org>
 <CAFA6WYM1NrghG9qxUhrm76kopvBx9nmCL9XnRs11ysb2Yr0+Qw@mail.gmail.com>
 <20190604200951.GB29739@sasha-vm> <CAFA6WYMOjgHRw9RVrjherNo0ZNbTtEonPwSFFC0dT4CZO=A1NQ@mail.gmail.com>
In-Reply-To: <CAFA6WYMOjgHRw9RVrjherNo0ZNbTtEonPwSFFC0dT4CZO=A1NQ@mail.gmail.com>
From:   Sumit Garg <sumit.garg@linaro.org>
Date:   Fri, 14 Jun 2019 16:11:11 +0530
Message-ID: <CAFA6WYP4Tm-K3PxvbQCqeOka6mvq3ebYYjKp0fjga9mV=OMUQQ@mail.gmail.com>
Subject: Re: [PATCH v4 1/2] fTPM: firmware TPM running in TEE
To:     Sasha Levin <sashal@kernel.org>
Cc:     peterhuewe@gmx.de,
        Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>,
        jgg@ziepe.ca, corbet@lwn.net,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-doc@vger.kernel.org, linux-integrity@vger.kernel.org,
        Microsoft Linux Kernel List <linux-kernel@microsoft.com>,
        Thirupathaiah Annapureddy <thiruan@microsoft.com>,
        "Bryan Kelly (CSI)" <bryankel@microsoft.com>,
        tee-dev@lists.linaro.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, 5 Jun 2019 at 16:39, Sumit Garg <sumit.garg@linaro.org> wrote:
>
> On Wed, 5 Jun 2019 at 01:39, Sasha Levin <sashal@kernel.org> wrote:
> >
> > On Tue, Jun 04, 2019 at 11:45:52AM +0530, Sumit Garg wrote:
> > >On Thu, 30 May 2019 at 20:58, Sasha Levin <sashal@kernel.org> wrote:
> > >> +       /* Open context with TEE driver */
> > >> +       pvt_data->ctx = tee_client_open_context(NULL, ftpm_tee_match, NULL,
> > >> +                                               NULL);
> > >> +       if (IS_ERR(pvt_data->ctx)) {
> > >> +               dev_err(dev, "%s:tee_client_open_context failed\n", __func__);
> > >
> > >Is this well tested? I see this misleading error multiple times as
> > >follows although TEE driver works pretty well.
> >
> > Yes, this was all functionally tested.
>
> Can you share your build instructions and testing approach?
>
> >
> > Why is this error message misleading? I'd be happy to fix it.
>

But still this message should be updated to represent correct status.
Maybe something like:

dev_warn(dev, "waiting for OP-TEE to be alive\n");

> IIUC, here you are trying to resolve dependency with OP-TEE driver
> using "-EPROBE_DEFER". So user shouldn't be prompted with error
> messages until OP-TEE driver comes up.
>
> BTW, for me this OP-TEE driver dependency seems not to work, boot is
> simply stuck waiting for device. Probably the reason being this fTPM
> driver is a platform driver and OP-TEE NOT a platform driver.
>

Apologies for the noise here. It works as expected.

-Sumit

> >
> > >Module built with "CONFIG_TCG_FTPM_TEE=y"
> > >
> > >[    1.436878] ftpm-tee tpm@0: ftpm_tee_probe:tee_client_open_context failed
> > >[    1.509471] ftpm-tee tpm@0: ftpm_tee_probe:tee_client_open_context failed
> > >[    1.517268] ftpm-tee tpm@0: ftpm_tee_probe:tee_client_open_context failed
> > >[    1.525596] ftpm-tee tpm@0: ftpm_tee_probe:tee_client_open_context failed
> >
> > Does the TEE have the fTPM implementation and such? Could you provide
> > details about your testing environment (hardware, fTPM verions, etc)?
> >
>
> I just did a sanity check on my arm64 machine (Developerbox), just
> adding following DT node and enabled CONFIG_TCG_FTPM_TEE=y:
>
> +    tpm@0 {
> +        compatible = "microsoft,ftpm";
> +    };
>
> Basically with no fTPM TA, I expected the driver to fail during
> "tee_client_open_session()" call with TA not found error and boot
> should continue. But it fails during "tee_client_open_context()" which
> opens a context with OP-TEE driver and has nothing to do with fTPM TA.
>
> -Sumit
>
> > --
> > Thanks,
> > Sasha
