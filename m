Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 273AF172F4B
	for <lists+linux-doc@lfdr.de>; Fri, 28 Feb 2020 04:27:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730768AbgB1D1j (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Thu, 27 Feb 2020 22:27:39 -0500
Received: from mail-oi1-f193.google.com ([209.85.167.193]:36147 "EHLO
        mail-oi1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730654AbgB1D1j (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 27 Feb 2020 22:27:39 -0500
Received: by mail-oi1-f193.google.com with SMTP id c16so1556325oic.3
        for <linux-doc@vger.kernel.org>; Thu, 27 Feb 2020 19:27:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=NDgUQnCysZ7NFsIwDokx6+x5eoZKUCkBzb/ZNj5Uk14=;
        b=qdaDLB40g+oyHb7JAcITCqVVaUs363TrbWV1T7QaYfFPpjtX8uy60Dkj2GU6XBpJGN
         lAN731kvw5+DtZs/Jmqj9a2zAwq3yyiugAXweWmF+/7ozu2pZbH5NlF01boeMxI4jdgy
         wPRxGYAstclqvIhU99ubI0HPyarsbPFL0vGzov59t9CBbria3MovzKiPtqyjDYHWW2JH
         2VT7OciJqRRyU7x4MX7hi9uKOBuzKgCDwo/tWsH1Su907YVLYbNXINavQw2gJe+mO85A
         /jDNEzcKqvCRg53uCe5vIYRMa8+V2F9YUQ2DdfHUYcFd8Xslim1gBU7pGdnNPZQA37BA
         sbBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=NDgUQnCysZ7NFsIwDokx6+x5eoZKUCkBzb/ZNj5Uk14=;
        b=AceIdV+cDdyf8Z0SwdhfKowYn4R4b62IL6Fc0uZ+KTUvi52vq738V2DMFFFRwtwvZ4
         FIAu3JTKzxa3tGcPaq9ATqXy6VIwhIjgqG5q2P+BFIsvv6OalSpOE/sc9+rrvvL15bZP
         enj+W0QWbdq36KEX9kHQFWgyDVXySm6Qa2W35AWkVwawjrt4vx48dhXgTj3tkZOloc0s
         RNtVrGorJwJSSqnsJuJBjonLMKOMd3dI1EKnfPw+ivbKN0XaTMAv9tK6F/NbY6c05knG
         u8EsSJbtUu+CbSGBUwK6UmaTUbxzkZoyCv+VX9TiQnzibOU4m36gQ8lfzcoS1D8M+KZB
         t0hw==
X-Gm-Message-State: APjAAAV1KfG8/JnT2M4eQ5fkYoWpqt0W54Ow3FlBhoF9wkVNr0ypXlQu
        OpyFs72V34iHsZY3HszgfR/H/L28ph9HgAY8jm1aBQ==
X-Google-Smtp-Source: APXvYqyOVn3TXyhx+GoHYcgMBBF9yOdT1HuTV+3w8j1kxYzXCl2z3YA80qnpCa43jnHHo1tUjwE1QG14/Zn3P7OrhMk=
X-Received: by 2002:aca:5205:: with SMTP id g5mr5640oib.43.1582860458043; Thu,
 27 Feb 2020 19:27:38 -0800 (PST)
MIME-Version: 1.0
References: <20200222014038.180923-1-saravanak@google.com> <20200222014038.180923-3-saravanak@google.com>
In-Reply-To: <20200222014038.180923-3-saravanak@google.com>
From:   Saravana Kannan <saravanak@google.com>
Date:   Thu, 27 Feb 2020 19:27:01 -0800
Message-ID: <CAGETcx-xxd_E=-zF5+a58queyGg_5JX9tbCm49YBtcvFUhVEZw@mail.gmail.com>
Subject: Re: [PATCH v1 2/5] driver core: Add fw_devlink kernel commandline option
To:     Jonathan Corbet <corbet@lwn.net>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Ard Biesheuvel <ardb@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>,
        Len Brown <lenb@kernel.org>
Cc:     Android Kernel Team <kernel-team@android.com>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        linux-efi <linux-efi@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        ACPI Devel Maling List <linux-acpi@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri, Feb 21, 2020 at 5:40 PM Saravana Kannan <saravanak@google.com> wrote:
>
> fwnode_operations.add_links allows creating device links from
> information provided by firmware.
>
> fwnode_operations.add_links is currently implemented only by
> OF/devicetree code and a specific case of efi. However, there's nothing
> preventing ACPI or other firmware types from implementing it.
>
> The OF implementation is currently controlled by a kernel commandline
> parameter called of_devlink.
>
> Since this feature is generic isn't limited to OF, add a generic
> fw_devlink kernel commandline parameter to control this feature across
> firmware types.
>
> Signed-off-by: Saravana Kannan <saravanak@google.com>
> ---
>  .../admin-guide/kernel-parameters.txt         | 18 +++++++++++++
>  drivers/base/core.c                           | 27 ++++++++++++++++++-
>  include/linux/fwnode.h                        |  2 ++
>  3 files changed, 46 insertions(+), 1 deletion(-)
>
> diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
> index dbc22d684627..29985152b66d 100644
> --- a/Documentation/admin-guide/kernel-parameters.txt
> +++ b/Documentation/admin-guide/kernel-parameters.txt
> @@ -1350,6 +1350,24 @@
>                         can be changed at run time by the max_graph_depth file
>                         in the tracefs tracing directory. default: 0 (no limit)
>
> +       fw_devlink=     [KNL] Create device links between consumer and supplier
> +                       devices by scanning the firmware to infer the
> +                       consumer/supplier relationships. This feature is
> +                       especially useful when drivers are loaded as modules as
> +                       it ensures proper ordering of tasks like device probing
> +                       (suppliers first, then consumers), supplier boot state
> +                       clean up (only after all consumers have probed),
> +                       suspend/resume & runtime PM (consumers first, then
> +                       suppliers).
> +                       Format: { off | permissive | on | rpm }
> +                       off --  Don't create device links from firmware info.
> +                       permissive -- Create device links from firmware info
> +                               but use it only for ordering boot state clean
> +                               up (sync_state() calls).
> +                       on --   Create device links from firmware info and use it
> +                               to enforce probe and suspend/resume ordering.
> +                       rpm --  Like "on", but also use to order runtime PM.
> +

A bit of bikeshedding myself: I could rename "on" to "enforce" and
"rpm" to "enforce-rpm".

Let me know if any of you have a strong preference on these two options.

-Saravana

>         gamecon.map[2|3]=
>                         [HW,JOY] Multisystem joystick and NES/SNES/PSX pad
>                         support via parallel port (up to 5 devices per port)
> diff --git a/drivers/base/core.c b/drivers/base/core.c
> index d32a3aefff32..aeaca8a3aad9 100644
> --- a/drivers/base/core.c
> +++ b/drivers/base/core.c
> @@ -2345,6 +2345,31 @@ static int device_private_init(struct device *dev)
>         return 0;
>  }
>
> +u32 fw_devlink_flags;
> +static int __init fw_devlink_setup(char *arg)
> +{
> +       if (!arg)
> +               return -EINVAL;
> +
> +       if (strcmp(arg, "off") == 0) {
> +               fw_devlink_flags = 0;
> +       } else if (strcmp(arg, "permissive") == 0) {
> +               fw_devlink_flags = DL_FLAG_SYNC_STATE_ONLY;
> +       } else if (strcmp(arg, "on") == 0) {
> +               fw_devlink_flags = DL_FLAG_AUTOPROBE_CONSUMER;
> +       } else if (strcmp(arg, "rpm") == 0) {
> +               fw_devlink_flags = DL_FLAG_AUTOPROBE_CONSUMER |
> +                                  DL_FLAG_PM_RUNTIME;
> +       }
> +       return 0;
> +}
> +early_param("fw_devlink", fw_devlink_setup);
> +
> +u32 fw_devlink_get_flags(void)
> +{
> +       return fw_devlink_flags;
> +}
> +
>  /**
>   * device_add - add device to device hierarchy.
>   * @dev: device.
> @@ -2493,7 +2518,7 @@ int device_add(struct device *dev)
>          */
>         device_link_add_missing_supplier_links();
>
> -       if (fwnode_has_op(dev->fwnode, add_links)) {
> +       if (fw_devlink_flags && fwnode_has_op(dev->fwnode, add_links)) {
>                 fw_ret = fwnode_call_int_op(dev->fwnode, add_links, dev);
>                 if (fw_ret == -ENODEV)
>                         device_link_wait_for_mandatory_supplier(dev);
> diff --git a/include/linux/fwnode.h b/include/linux/fwnode.h
> index 8feeb94b8acc..e0abafbb17f8 100644
> --- a/include/linux/fwnode.h
> +++ b/include/linux/fwnode.h
> @@ -170,4 +170,6 @@ struct fwnode_operations {
>         } while (false)
>  #define get_dev_from_fwnode(fwnode)    get_device((fwnode)->dev)
>
> +extern u32 fw_devlink_get_flags(void);
> +
>  #endif
> --
> 2.25.0.265.gbab2e86ba0-goog
>
