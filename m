Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 482C87AA52B
	for <lists+linux-doc@lfdr.de>; Fri, 22 Sep 2023 00:40:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232209AbjIUWkY (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Thu, 21 Sep 2023 18:40:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54940 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231810AbjIUWkW (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 21 Sep 2023 18:40:22 -0400
Received: from mail-oo1-xc31.google.com (mail-oo1-xc31.google.com [IPv6:2607:f8b0:4864:20::c31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2BF7C6E441
        for <linux-doc@vger.kernel.org>; Thu, 21 Sep 2023 11:56:24 -0700 (PDT)
Received: by mail-oo1-xc31.google.com with SMTP id 006d021491bc7-57b706f604aso30551eaf.0
        for <linux-doc@vger.kernel.org>; Thu, 21 Sep 2023 11:56:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1695322583; x=1695927383; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3wcs3HzZ31G3yJHKvNS30Y61xFRSAlRNAEiq/xuG55A=;
        b=USIz8S4Gbpxm6FvRfILKVdJY3aFTCDVsiipO1a2Y7gEXW7XAbXgTdvU2a4YefBGLf8
         3zT0YbgXpIm1LlSDqJ1iqfwhPUrTbRrQCWeiI2ktySzucjOVQzwfjXxdl9fft+FFwJJI
         974io+SgRuUYR6SQW9LbR7+6K4CTiZl3AvONI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695322583; x=1695927383;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3wcs3HzZ31G3yJHKvNS30Y61xFRSAlRNAEiq/xuG55A=;
        b=KJHMRkqil2OSWTJLYtSAE0abFnIXWqtOk0vNmhMxMUzhahYWNdhAa8s4HiI/8XG2eb
         fFL2+a7uva5Z0o445DOlUKpflvsE8DG83zzj/fujSwzkZTj1R/3/HyRKdI6+M0vyN/00
         wYsMdLbyt5Q+ujkwH7TI3FD5U70pANtz3dONySC+3Ew5fQGZBIL1tBrWAzGYTLgQwe7J
         6DoqyzVnYEdy/1qUCQQR8gZlmgxyadCBQyYNbm/ZKMEvpkYKgcsUmeGqyAQSdMwY8G2f
         +XAgeYC5kck9aJjxykSbCfuq6uWFSPLN2mDbK8aHqhU3ORS/lY4crYACIJ5PJLRfF212
         NhDA==
X-Gm-Message-State: AOJu0YxQGDS4VntVm7nwU1aI6tErEp+8HnaNf6omvtrUaijozVRKME7S
        x0AMYQV8ky6uLojLGRyWFeP1Mr+ZIkzqKvU/NI8=
X-Google-Smtp-Source: AGHT+IGo8chOAyUOjw3Uu915Dr9gJMbWW2yA0Q5LaVT1fjEu/+a7aKJpFfjk3kfI/F8Nr6/griqylw==
X-Received: by 2002:ac8:5bcb:0:b0:413:5f84:424d with SMTP id b11-20020ac85bcb000000b004135f84424dmr4847404qtb.20.1695267864964;
        Wed, 20 Sep 2023 20:44:24 -0700 (PDT)
Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com. [209.85.160.175])
        by smtp.gmail.com with ESMTPSA id 11-20020ac8564b000000b003f6ac526568sm258899qtt.39.2023.09.20.20.44.23
        for <linux-doc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 20 Sep 2023 20:44:23 -0700 (PDT)
Received: by mail-qt1-f175.google.com with SMTP id d75a77b69052e-41513d2cca7so249231cf.0
        for <linux-doc@vger.kernel.org>; Wed, 20 Sep 2023 20:44:23 -0700 (PDT)
X-Received: by 2002:a05:622a:11c5:b0:403:fdf1:e05e with SMTP id
 n5-20020a05622a11c500b00403fdf1e05emr100304qtk.19.1695267863107; Wed, 20 Sep
 2023 20:44:23 -0700 (PDT)
MIME-Version: 1.0
References: <20230829053201.423261-1-brpol@chromium.org> <20230829053201.423261-8-brpol@chromium.org>
 <393d65d0-8886-6663-5521-ba495d711750@collabora.com>
In-Reply-To: <393d65d0-8886-6663-5521-ba495d711750@collabora.com>
From:   Brandon Ross Pollack <brpol@chromium.org>
Date:   Thu, 21 Sep 2023 12:44:10 +0900
X-Gmail-Original-Message-ID: <CALWYx-ZSe0MO7Lhp=DVG3LNUU5ZnDWA1PjOL1nWm6n-Aj8TYkg@mail.gmail.com>
Message-ID: <CALWYx-ZSe0MO7Lhp=DVG3LNUU5ZnDWA1PjOL1nWm6n-Aj8TYkg@mail.gmail.com>
Subject: Re: [PATCH v6 7/7] drm/vkms Add hotplug support via configfs to VKMS.
To:     Helen Koike <helen.koike@collabora.com>
Cc:     marius.vlad@collabora.com, mairacanal@riseup.net,
        jshargo@chromium.org, hamohammed.sa@gmail.com,
        rodrigosiqueiramelo@gmail.com, linux-doc@vger.kernel.org,
        hirono@chromium.org, corbet@lwn.net, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, melissa.srw@gmail.com,
        mduggan@chromium.org, mripard@kernel.org, tzimmermann@suse.de
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Sorry, these tests are actually running in the chromeOS infrastructure
environment!  A similar test can be written in IGT (and I think is in
the other chain that Marius published)

On Thu, Sep 21, 2023 at 3:03=E2=80=AFAM Helen Koike <helen.koike@collabora.=
com> wrote:
>
> Hello!
>
> Thanks for the patch.
>
> On 29/08/2023 02:30, Brandon Pollack wrote:
> > This change adds the ability to read or write a "1" or a "0" to the
> > newly added "connected" attribute of a connector in the vkms entry in
> > configfs.
> >
> > A write will trigger a call to drm_kms_helper_hotplug_event, causing a
> > hotplug uevent.
> >
> > With this we can write virtualized multidisplay tests that involve
> > hotplugging displays (eg recompositing windows when a monitor is turned
> > off).
>
> Are these tests going to be added in igt?
>
> I was just wondering if it requires any special thing for drm ci:
>
> https://lists.freedesktop.org/archives/dri-devel/2023-September/423719.ht=
ml
>
> (btw, it would be awesome of you could test your changes with drm ci :)
>
> Regards,
> Helen
>
> >
> > Signed-off-by: Brandon Pollack <brpol@chromium.org>
> > ---
> >   Documentation/gpu/vkms.rst           |  2 +-
> >   drivers/gpu/drm/vkms/vkms_configfs.c | 68 ++++++++++++++++++++++++++-=
-
> >   drivers/gpu/drm/vkms/vkms_drv.h      | 11 +++++
> >   drivers/gpu/drm/vkms/vkms_output.c   | 47 ++++++++++++++++++-
> >   4 files changed, 123 insertions(+), 5 deletions(-)
> >
> > diff --git a/Documentation/gpu/vkms.rst b/Documentation/gpu/vkms.rst
> > index c3875bf66dba..7f715097539c 100644
> > --- a/Documentation/gpu/vkms.rst
> > +++ b/Documentation/gpu/vkms.rst
> > @@ -145,7 +145,7 @@ We want to be able to manipulate vkms instances wit=
hout having to reload the
> >   module. Such configuration can be added as extensions to vkms's Confi=
gFS
> >   support. Use-cases:
> >
> > -- Hotplug/hotremove connectors on the fly (to be able to test DP MST h=
andling
> > +- Hotremove connectors on the fly (to be able to test DP MST handling
> >     of compositors).
> >
> >   - Change output configuration: Plug/unplug screens, change EDID, allo=
w changing
> > diff --git a/drivers/gpu/drm/vkms/vkms_configfs.c b/drivers/gpu/drm/vkm=
s/vkms_configfs.c
> > index bc35dcc47585..d231e28101ae 100644
> > --- a/drivers/gpu/drm/vkms/vkms_configfs.c
> > +++ b/drivers/gpu/drm/vkms/vkms_configfs.c
> > @@ -1,5 +1,6 @@
> >   // SPDX-License-Identifier: GPL-2.0+
> >
> > +#include "drm/drm_probe_helper.h"
> >   #include <linux/configfs.h>
> >   #include <linux/mutex.h>
> >   #include <linux/platform_device.h>
> > @@ -40,6 +41,7 @@
> >    *   `-- vkms
> >    *       `-- test
> >    *           |-- connectors
> > + *                `-- connected
> >    *           |-- crtcs
> >    *           |-- encoders
> >    *           |-- planes
> > @@ -89,6 +91,14 @@
> >    *
> >    *   echo 1 > /config/vkms/test/enabled
> >    *
> > + * By default no display is "connected" so to connect a connector you'=
ll also
> > + * have to write 1 to a connectors "connected" attribute::
> > + *
> > + *   echo 1 > /config/vkms/test/connectors/connector/connected
> > + *
> > + * One can verify that this is worked using the `modetest` utility or =
the
> > + * equivalent for your platform.
> > + *
> >    * When you're done with the virtual device, you can clean up the dev=
ice like
> >    * so::
> >    *
> > @@ -236,7 +246,58 @@ static void add_possible_encoders(struct config_gr=
oup *parent,
> >
> >   /*  Connector item, e.g. /config/vkms/device/connectors/ID */
> >
> > +static ssize_t connector_connected_show(struct config_item *item, char=
 *buf)
> > +{
> > +     struct vkms_config_connector *connector =3D
> > +             item_to_config_connector(item);
> > +     struct vkms_configfs *configfs =3D connector_item_to_configfs(ite=
m);
> > +     bool connected =3D false;
> > +
> > +     mutex_lock(&configfs->lock);
> > +     connected =3D connector->connected;
> > +     mutex_unlock(&configfs->lock);
> > +
> > +     return sprintf(buf, "%d\n", connected);
> > +}
> > +
> > +static ssize_t connector_connected_store(struct config_item *item,
> > +                                      const char *buf, size_t len)
> > +{
> > +     struct vkms_config_connector *connector =3D
> > +             item_to_config_connector(item);
> > +     struct vkms_configfs *configfs =3D connector_item_to_configfs(ite=
m);
> > +     int val, ret;
> > +
> > +     ret =3D kstrtouint(buf, 10, &val);
> > +     if (ret)
> > +             return ret;
> > +
> > +     if (val !=3D 1 && val !=3D 0)
> > +             return -EINVAL;
> > +
> > +     mutex_lock(&configfs->lock);
> > +     connector->connected =3D val;
> > +     if (!connector->connector) {
> > +             pr_info("VKMS Device %s is not yet enabled, connector wil=
l be enabled on start",
> > +                     configfs->device_group.cg_item.ci_name);
> > +     }
> > +     mutex_unlock(&configfs->lock);
> > +
> > +     if (connector->connector)
> > +             drm_kms_helper_hotplug_event(connector->connector->dev);
> > +
> > +     return len;
> > +}
> > +
> > +CONFIGFS_ATTR(connector_, connected);
> > +
> > +static struct configfs_attribute *connector_attrs[] =3D {
> > +     &connector_attr_connected,
> > +     NULL,
> > +};
> > +
> >   static struct config_item_type connector_type =3D {
> > +     .ct_attrs =3D connector_attrs,
> >       .ct_owner =3D THIS_MODULE,
> >   };
> >
> > @@ -264,7 +325,7 @@ static ssize_t plane_type_show(struct config_item *=
item, char *buf)
> >       plane_type =3D plane->type;
> >       mutex_unlock(&configfs->lock);
> >
> > -     return sprintf(buf, "%u", plane_type);
> > +     return sprintf(buf, "%u\n", plane_type);
> >   }
> >
> >   static ssize_t plane_type_store(struct config_item *item, const char =
*buf,
> > @@ -319,6 +380,7 @@ static struct config_group *connectors_group_make(s=
truct config_group *group,
> >                                   &connector_type);
> >       add_possible_encoders(&connector->config_group,
> >                             &connector->possible_encoders.group);
> > +     connector->connected =3D false;
> >
> >       return &connector->config_group;
> >   }
> > @@ -500,7 +562,7 @@ static ssize_t device_enabled_show(struct config_it=
em *item, char *buf)
> >       is_enabled =3D configfs->vkms_device !=3D NULL;
> >       mutex_unlock(&configfs->lock);
> >
> > -     return sprintf(buf, "%d", is_enabled);
> > +     return sprintf(buf, "%d\n", is_enabled);
> >   }
> >
> >   static ssize_t device_enabled_store(struct config_item *item, const c=
har *buf,
> > @@ -557,7 +619,7 @@ static ssize_t device_id_show(struct config_item *i=
tem, char *buf)
> >
> >       mutex_unlock(&configfs->lock);
> >
> > -     return sprintf(buf, "%d", id);
> > +     return sprintf(buf, "%d\n", id);
> >   }
> >
> >   CONFIGFS_ATTR_RO(device_, id);
> > diff --git a/drivers/gpu/drm/vkms/vkms_drv.h b/drivers/gpu/drm/vkms/vkm=
s_drv.h
> > index 2b9545ada9c2..5336281f397e 100644
> > --- a/drivers/gpu/drm/vkms/vkms_drv.h
> > +++ b/drivers/gpu/drm/vkms/vkms_drv.h
> > @@ -3,6 +3,7 @@
> >   #ifndef _VKMS_DRV_H_
> >   #define _VKMS_DRV_H_
> >
> > +#include "drm/drm_connector.h"
> >   #include <linux/configfs.h>
> >   #include <linux/hrtimer.h>
> >
> > @@ -147,7 +148,9 @@ struct vkms_config_links {
> >
> >   struct vkms_config_connector {
> >       struct config_group config_group;
> > +     struct drm_connector *connector;
> >       struct vkms_config_links possible_encoders;
> > +     bool connected;
> >   };
> >
> >   struct vkms_config_crtc {
> > @@ -220,6 +223,10 @@ struct vkms_device {
> >   #define item_to_configfs(item) \
> >       container_of(to_config_group(item), struct vkms_configfs, device_=
group)
> >
> > +#define connector_item_to_configfs(item)                              =
       \
> > +     container_of(to_config_group(item->ci_parent), struct vkms_config=
fs, \
> > +                  connectors_group)
> > +
> >   #define item_to_config_connector(item)                               =
     \
> >       container_of(to_config_group(item), struct vkms_config_connector,=
 \
> >                    config_group)
> > @@ -279,4 +286,8 @@ int vkms_enable_writeback_connector(struct vkms_dev=
ice *vkmsdev,
> >   int vkms_init_configfs(void);
> >   void vkms_unregister_configfs(void);
> >
> > +/* Connector hotplugging */
> > +enum drm_connector_status vkms_connector_detect(struct drm_connector *=
connector,
> > +                                             bool force);
> > +
> >   #endif /* _VKMS_DRV_H_ */
> > diff --git a/drivers/gpu/drm/vkms/vkms_output.c b/drivers/gpu/drm/vkms/=
vkms_output.c
> > index 0ee1f3f4a305..1a1cd0202c5f 100644
> > --- a/drivers/gpu/drm/vkms/vkms_output.c
> > +++ b/drivers/gpu/drm/vkms/vkms_output.c
> > @@ -1,5 +1,6 @@
> >   // SPDX-License-Identifier: GPL-2.0+
> >
> > +#include <drm/drm_print.h>
> >   #include <drm/drm_atomic_helper.h>
> >   #include <drm/drm_connector.h>
> >   #include <drm/drm_crtc.h>
> > @@ -8,10 +9,12 @@
> >   #include <drm/drm_plane.h>
> >   #include <drm/drm_probe_helper.h>
> >   #include <drm/drm_simple_kms_helper.h>
> > +#include <linux/printk.h>
> >
> >   #include "vkms_drv.h"
> >
> >   static const struct drm_connector_funcs vkms_connector_funcs =3D {
> > +     .detect =3D vkms_connector_detect,
> >       .fill_modes =3D drm_helper_probe_single_connector_modes,
> >       .destroy =3D drm_connector_cleanup,
> >       .reset =3D drm_atomic_helper_connector_reset,
> > @@ -19,6 +22,48 @@ static const struct drm_connector_funcs vkms_connect=
or_funcs =3D {
> >       .atomic_destroy_state =3D drm_atomic_helper_connector_destroy_sta=
te,
> >   };
> >
> > +static const struct vkms_config_connector *
> > +find_config_for_connector(struct drm_connector *connector)
> > +{
> > +     struct vkms_device *vkms =3D drm_device_to_vkms_device(connector-=
>dev);
> > +     struct vkms_configfs *configfs =3D vkms->configfs;
> > +     struct config_item *item;
> > +
> > +     if (!configfs) {
> > +             pr_info("Default connector has no configfs entry");
> > +             return NULL;
> > +     }
> > +
> > +     list_for_each_entry(item, &configfs->connectors_group.cg_children=
,
> > +                         ci_entry) {
> > +             struct vkms_config_connector *config_connector =3D
> > +                     item_to_config_connector(item);
> > +             if (config_connector->connector =3D=3D connector)
> > +                     return config_connector;
> > +     }
> > +
> > +     pr_warn("Could not find config to match connector %s, but configf=
s was initialized",
> > +             connector->name);
> > +
> > +     return NULL;
> > +}
> > +
> > +enum drm_connector_status vkms_connector_detect(struct drm_connector *=
connector,
> > +                                             bool force)
> > +{
> > +     enum drm_connector_status status =3D connector_status_connected;
> > +     const struct vkms_config_connector *config_connector =3D
> > +             find_config_for_connector(connector);
> > +
> > +     if (!config_connector)
> > +             return connector_status_connected;
> > +
> > +     if (!config_connector->connected)
> > +             status =3D connector_status_disconnected;
> > +
> > +     return status;
> > +}
> > +
> >   static const struct drm_encoder_funcs vkms_encoder_funcs =3D {
> >       .destroy =3D drm_encoder_cleanup,
> >   };
> > @@ -280,12 +325,12 @@ int vkms_output_init(struct vkms_device *vkmsdev)
> >               struct vkms_config_connector *config_connector =3D
> >                       item_to_config_connector(item);
> >               struct drm_connector *connector =3D vkms_connector_init(v=
kmsdev);
> > -
> >               if (IS_ERR(connector)) {
> >                       DRM_ERROR("Failed to init connector from config: =
%s",
> >                                 item->ci_name);
> >                       return PTR_ERR(connector);
> >               }
> > +             config_connector->connector =3D connector;
> >
> >               for (int j =3D 0; j < output->num_encoders; j++) {
> >                       struct encoder_map *encoder =3D &encoder_map[j];
