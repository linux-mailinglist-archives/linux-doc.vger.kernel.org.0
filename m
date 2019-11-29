Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 597C010D5F1
	for <lists+linux-doc@lfdr.de>; Fri, 29 Nov 2019 14:01:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726770AbfK2NBt (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Fri, 29 Nov 2019 08:01:49 -0500
Received: from mail-qt1-f195.google.com ([209.85.160.195]:46928 "EHLO
        mail-qt1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726360AbfK2NBt (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 29 Nov 2019 08:01:49 -0500
Received: by mail-qt1-f195.google.com with SMTP id r20so32336182qtp.13
        for <linux-doc@vger.kernel.org>; Fri, 29 Nov 2019 05:01:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Xn54XTvcNkal14NNHB7+Vzm9BZs6YXQQ3RAQ8lYr/oc=;
        b=An+4zXCFdte8eMvcqUEG3vfTxzYHLztNUyO+dIju42gILkNWJLODGcoxqgrQR7mqsl
         OfYl8RSMNw0xmz5Bgz11IFl+yVb5ur2ssG+rt2UWWkK3GXNcN5i0+6XzLBwaYkxROqrK
         hf05akothfHLjS+dc3IJ2nmpGRpB4rtw7hvhHxMw/wuCu0I+T8j69hAB5WrJ0UhCECxf
         RMt3xTOTWuVlOuPignDWsj0EBINdiInOto4yDYiZ/CqeuULQuwnS4TQ7ua9n3EYQ1Opt
         cF4tfnfdW0s1OqfNGbRi1bC6J2MgQcaHGhBWzpy10bkEgFRVncoZ+2BQibA0Id+qjfm/
         kEFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Xn54XTvcNkal14NNHB7+Vzm9BZs6YXQQ3RAQ8lYr/oc=;
        b=m21RHSOWHq3wixLrfeLM7OB5h1OXzg3saavdSZZ4j8PuFktaiQCslnDxJO3f2YQqKY
         Fzgioq3YW4lfdtEMB4Ip3+fJoPamZxgaTbe+UUmUQpmkjD7XFS+uT5Qdnh6BzUcrzBID
         O9SS6YkHu/E0ghORPR2LNrDDaxDkw1JyNd3cTDws2zrLM6TQgnz4t5zgX40DbH02iZgd
         3DzuGfPBBRKOYUAp5WrTv26WxD0GUiQ8awJvbyx3W424hscGI8WWYrNj/QoQQWKjdN5i
         wel/4JwzVEw56xmWFmdny4+rg6fu+sbafi2CYuTsBspVNWG0VdwQG7PA6pCui93RAItZ
         uosA==
X-Gm-Message-State: APjAAAVEEy5eZT8pGaBHhQWkKnd+P6B0It8ygTKMqUWCBsbc1B5+sY3Q
        125PF2+4c3hOYxgUFcE+7HotkFWGs/XYsYUpQeeC3A==
X-Google-Smtp-Source: APXvYqxnCMUzN7K5F96FwviGs9debEPUho46vDAcIfSuTnPxYu+XchM5mkJV2q7pXMOhaWj2Um8cNDKqRVhiHyGh8zE=
X-Received: by 2002:ac8:41c3:: with SMTP id o3mr35156316qtm.88.1575032508294;
 Fri, 29 Nov 2019 05:01:48 -0800 (PST)
MIME-Version: 1.0
References: <20191119231912.12768-1-mike.leach@linaro.org> <20191119231912.12768-5-mike.leach@linaro.org>
 <ce6d3334-2baf-0528-33a1-0157a8ad0c57@arm.com>
In-Reply-To: <ce6d3334-2baf-0528-33a1-0157a8ad0c57@arm.com>
From:   Mike Leach <mike.leach@linaro.org>
Date:   Fri, 29 Nov 2019 13:01:37 +0000
Message-ID: <CAJ9a7Vj0fL4bkA+k-ip-NBwJ4nU3B+sCmPQZH1j9PdXnR66Veg@mail.gmail.com>
Subject: Re: [PATCH v5 04/14] coresight: cti: Add sysfs trigger / channel
 programming API
To:     Suzuki Kuruppassery Poulose <suzuki.poulose@arm.com>
Cc:     Coresight ML <coresight@lists.linaro.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        devicetree@vger.kernel.org,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hi Suzuki,


On Wed, 27 Nov 2019 at 18:40, Suzuki Kuruppassery Poulose
<suzuki.poulose@arm.com> wrote:
>
> On 19/11/2019 23:19, Mike Leach wrote:
> > Adds a user API to allow programming of CTI by trigger ID and
> > channel number. This will take the channel and trigger ID supplied
> > by the user and program the appropriate register values.
> >
> > Signed-off-by: Mike Leach <mike.leach@linaro.org>
> > ---
>
> > +
> > +static ssize_t chan_xtrigs_view_show(struct device *dev,
> > +                                  struct device_attribute *attr,
> > +                                  char *buf)
> > +{
> > +     struct cti_drvdata *drvdata = dev_get_drvdata(dev->parent);
> > +     struct cti_config *cfg = &drvdata->config;
> > +     int used = 0, reg_idx;
> > +     int buf_sz = PAGE_SIZE;
> > +     u32 chan_mask = BIT(cfg->xtrig_rchan_sel);
> > +
> > +     used += scnprintf(buf, buf_sz, "[%d] IN: ", cfg->xtrig_rchan_sel);
> > +     for (reg_idx = 0;
> > +          reg_idx < drvdata->config.nr_trig_max;
> > +          reg_idx++) {
> > +             if (chan_mask & cfg->ctiinen[reg_idx]) {
> > +                     used += scnprintf(buf + used, buf_sz - used, "%d ",
> > +                                       reg_idx);
> > +             }
> > +     }
>
> As a security measure, we must make sure that we have space left in the
> buffer. We could end up passing "negative" numbers for the size
> argument, in the worst case.
>

The return value from scnprintf() is always the _actual_ number of
characters added to the buffer, not as per snprintf() which returns
the number that could have been printed if there were sufficient
space.
Thus used can never exceed the buffer size.

Regards

Mike


> > +
> > +     used += scnprintf(buf + used, buf_sz - used, "OUT: ");
> > +     for (reg_idx = 0;
> > +          reg_idx < drvdata->config.nr_trig_max;
> > +          reg_idx++) {
> > +             if (chan_mask & cfg->ctiouten[reg_idx]) {
> > +                     used += scnprintf(buf + used, buf_sz - used, "%d ",
> > +                                       reg_idx);
> > +             }
> > +     }
> > +     used += scnprintf(buf + used, buf_sz - used, "\n");
> > +     return used;
> > +}
> > +static DEVICE_ATTR_RW(chan_xtrigs_view);
>
>
> The rest looks fine to me.
>
> Suzuki



-- 
Mike Leach
Principal Engineer, ARM Ltd.
Manchester Design Centre. UK
