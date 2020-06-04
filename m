Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BC59A1EE07F
	for <lists+linux-doc@lfdr.de>; Thu,  4 Jun 2020 11:05:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728452AbgFDJFm (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Thu, 4 Jun 2020 05:05:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59706 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726664AbgFDJFl (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 4 Jun 2020 05:05:41 -0400
Received: from mail-yb1-xb44.google.com (mail-yb1-xb44.google.com [IPv6:2607:f8b0:4864:20::b44])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 02C60C03E96E
        for <linux-doc@vger.kernel.org>; Thu,  4 Jun 2020 02:05:39 -0700 (PDT)
Received: by mail-yb1-xb44.google.com with SMTP id j8so2553852ybj.12
        for <linux-doc@vger.kernel.org>; Thu, 04 Jun 2020 02:05:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=2anrII6963AR/Wz74rXx28vPNao9EA9gxM6bR73yPeI=;
        b=f1H/yZCDQdANRjrTLUGN/RkXjoJIzHFS696pGR0pXRViXoZLAKh/UARuvbh1X48Px3
         JDn5L8mFulCRzmlgrYou9g9uuqW6R55VzVfbojHMDy4l9EGI0h6ixdXC4UWNS9iVMyqE
         +eGtlEnlrUBl4D6vfz2nvp7MGO3JAWA5Y5esSE2hRUsZjnJ0ACkFYl77Pq90F6jZuf2v
         us1jJeoPwL9TBVt9oo0GPoFus0A0dkbk77Cqg6X6v8UCk48uLpMjIGdUe5dmTdVMHPbz
         xSZx/poAtg4RW8kP3IbNEIMW+tUPFq1GeeVizmyh8ku4O/MqrX+Xcy5vpHNIuNsatf5Y
         hhBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=2anrII6963AR/Wz74rXx28vPNao9EA9gxM6bR73yPeI=;
        b=rQJ/H+OophjfGIgEZGDWepwVkEsDQNHPnmQU6lhgR/GjzvhlEJfYz4Rzqij5ApPX04
         e0C50pIqK4wq5vfn70xf6c8kPnrH8b9EtNHTqoW3URxel7aoHowHxlEbWFVCibEclT2/
         7VJPyLMfgTPsDb1/Kuae29dUBaP73YHlHDX7MuP+li9X6Exzf9qeUD5nUDhi8QXDkoYz
         kGl+SV81sO6rV9tzAS1G9i36ds+pQYg56b+DF047OzOuI91VFzw8Ki8XbTlPOB5m1bCt
         qbUzxcc9Kv680BEUwSIdXlf7xdHCFq8RxTc+0L/leR+FT0MOBeU78UJXIR4aJvFKuWMk
         H/LQ==
X-Gm-Message-State: AOAM531cDWrOMWYmYL3KtSWIe1COD8wh+jFEHUK/IJb0pSTHQG/ZJuP5
        eOkleBmzG6yQ2MdWsCEWqLNF71xmr7LhsNFG/EDb8A==
X-Google-Smtp-Source: ABdhPJwUB8zlPDVGkckdwEUKCDS5uUAO24MKWJlh2vcz2/rOaAjyIUp+4d29i9exJq+fCNdYlP9yughLP5I8FopI27I=
X-Received: by 2002:a25:4f08:: with SMTP id d8mr6779430ybb.125.1591261538833;
 Thu, 04 Jun 2020 02:05:38 -0700 (PDT)
MIME-Version: 1.0
References: <1591253979-29067-1-git-send-email-sumit.garg@linaro.org>
In-Reply-To: <1591253979-29067-1-git-send-email-sumit.garg@linaro.org>
From:   Maxim Uvarov <maxim.uvarov@linaro.org>
Date:   Thu, 4 Jun 2020 12:05:27 +0300
Message-ID: <CAD8XO3bw5zofRynNWUW61nb8Y=2sVMqXE0zWKFQYCHr5CQTNYg@mail.gmail.com>
Subject: Re: [PATCH v2] Documentation: tee: Document TEE kernel interface
To:     Sumit Garg <sumit.garg@linaro.org>
Cc:     Jens Wiklander <jens.wiklander@linaro.org>, corbet@lwn.net,
        Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>,
        "tee-dev @ lists . linaro . org" <tee-dev@lists.linaro.org>,
        linux-doc@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        op-tee@lists.trustedfirmware.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Looks good for me.

Reviewed-by: Maxim Uvarov <maxim.uvarov@linaro.org>

On Thu, 4 Jun 2020 at 10:00, Sumit Garg <sumit.garg@linaro.org> wrote:
>
> Update documentation with TEE bus infrastructure which provides an
> interface for kernel client drivers to communicate with corresponding
> Trusted Application.
>
> Signed-off-by: Sumit Garg <sumit.garg@linaro.org>
> ---
>
> Changes in v2:
> - Add TEE client driver example snippet.
>
>  Documentation/tee.txt | 68 +++++++++++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 68 insertions(+)
>
> diff --git a/Documentation/tee.txt b/Documentation/tee.txt
> index c8fad81..350dd40 100644
> --- a/Documentation/tee.txt
> +++ b/Documentation/tee.txt
> @@ -53,6 +53,66 @@ clients, forward them to the TEE and send back the results. In the case of
>  supplicants the communication goes in the other direction, the TEE sends
>  requests to the supplicant which then sends back the result.
>
> +The TEE kernel interface
> +========================
> +
> +Kernel provides a TEE bus infrastructure where a Trusted Application is
> +represented as a device identified via Universally Unique Identifier (UUID) and
> +client drivers register a table of supported device UUIDs.
> +
> +TEE bus infrastructure registers following APIs:
> +-  match(): iterates over the client driver UUID table to find a corresponding
> +   match for device UUID. If a match is found, then this particular device is
> +   probed via corresponding probe API registered by the client driver. This
> +   process happens whenever a device or a client driver is registered with TEE
> +   bus.
> +-  uevent(): notifies user-space (udev) whenever a new device is registered on
> +   TEE bus for auto-loading of modularized client drivers.
> +
> +TEE bus device enumeration is specific to underlying TEE implementation, so it
> +is left open for TEE drivers to provide corresponding implementation.
> +
> +Then TEE client driver can talk to a matched Trusted Application using APIs
> +listed in include/linux/tee_drv.h.
> +
> +TEE client driver example
> +-------------------------
> +
> +Suppose a TEE client driver needs to communicate with a Trusted Application
> +having UUID: ``ac6a4085-0e82-4c33-bf98-8eb8e118b6c2``, so driver registration
> +snippet would look like::
> +
> +       static const struct tee_client_device_id client_id_table[] = {
> +               {UUID_INIT(0xac6a4085, 0x0e82, 0x4c33,
> +                          0xbf, 0x98, 0x8e, 0xb8, 0xe1, 0x18, 0xb6, 0xc2)},
> +               {}
> +       };
> +
> +       MODULE_DEVICE_TABLE(tee, client_id_table);
> +
> +       static struct tee_client_driver client_driver = {
> +               .id_table       = client_id_table,
> +               .driver         = {
> +                       .name           = DRIVER_NAME,
> +                       .bus            = &tee_bus_type,
> +                       .probe          = client_probe,
> +                       .remove         = client_remove,
> +               },
> +       };
> +
> +       static int __init client_init(void)
> +       {
> +               return driver_register(&client_driver.driver);
> +       }
> +
> +       static void __exit client_exit(void)
> +       {
> +               driver_unregister(&client_driver.driver);
> +       }
> +
> +       module_init(client_init);
> +       module_exit(client_exit);
> +
>  OP-TEE driver
>  =============
>
> @@ -112,6 +172,14 @@ kernel are handled by the kernel driver. Other RPC messages will be forwarded to
>  tee-supplicant without further involvement of the driver, except switching
>  shared memory buffer representation.
>
> +OP-TEE device enumeration
> +-------------------------
> +
> +OP-TEE provides a pseudo Trusted Application: drivers/tee/optee/device.c in
> +order to support device enumeration. In other words, OP-TEE driver invokes this
> +application to retrieve a list of Trusted Applications which can be registered
> +as devices on the TEE bus.
> +
>  AMD-TEE driver
>  ==============
>
> --
> 2.7.4
>
