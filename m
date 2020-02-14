Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C8DAF15F9C8
	for <lists+linux-doc@lfdr.de>; Fri, 14 Feb 2020 23:31:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727458AbgBNWbQ (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Fri, 14 Feb 2020 17:31:16 -0500
Received: from mail-yb1-f196.google.com ([209.85.219.196]:34288 "EHLO
        mail-yb1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725991AbgBNWbP (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 14 Feb 2020 17:31:15 -0500
Received: by mail-yb1-f196.google.com with SMTP id w17so5575309ybm.1
        for <linux-doc@vger.kernel.org>; Fri, 14 Feb 2020 14:31:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=zOoACw77ep1wy+Wyw/chs5Xn92RTyLfJh27q15HRooU=;
        b=JE+jgO0/8F38g2n0VuvmRO1k3tAN2dqoAys4yQXvG/94RjB0Q84Ts9xHcv8DVQlNpS
         dISOCRpTWIHLFRb0fgFXnFHKF+G6BQ0Y1QYrTYWjlAokTVITsWdvmNL9glFd6QLie1rv
         +nPT4GMad1eMSBP4Jlw493dB+FsRckaCqKw1uMWS9BjvP/Z4uFqve3+PwTkIGbv6q16M
         X/LjhzBWRBnw37EC7Ea+CTQ/KX+mqARy7h60ZFVucVAiH5zrLgrQ1/N633KRKUFU9kUj
         vVOtQ/RTfvcpbdI2SxOzQ9zO/9kMzTXficqZLyLLVZlOAxVx/FVIdBZAHCTSiVrfmzHR
         zIBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=zOoACw77ep1wy+Wyw/chs5Xn92RTyLfJh27q15HRooU=;
        b=o9vdSAgLcweIUP9CSEU6O4/neFrk5VCIqSGNkuS0zqhRZ04oH5mOubrfQpJvjCzY6S
         35JtGbOdeM+u5MMChEP4uHxN1C+LGkiZynoRpUlSNzVpYVPcLoheOmnAj54jSbkJceQ/
         3CMEAz21rr6hZjN4ZNUl/nnBQl9OV9ojsNgh3wAHY3ES7myQOAC/YnkQRCmXi7ipjUxt
         unvxYEA8J/dQLevbw2RxxmRZXWi/Z+1mqNJEtBtVlV+EeyAlI4sUdI9S8ti2GxYwVaFl
         SQ0ks4mnJLJJn/t4K9CR+BtRn5M99spsS3b5jc6q6ESpcrIbu71FYBMiH3C0ZXu5eueq
         AP7w==
X-Gm-Message-State: APjAAAX6a3jgSsV9XfRxdCtqxOwDsMS5KUa2SNXo/l9psGrkT3D5Y5GV
        mvHvdbBUAeCfvNLjbhKRjjO5Ow==
X-Google-Smtp-Source: APXvYqxQH1vOghth0zLCSbjENMZlafZpppslkqVGjm52mIoiUn2K/q8QkdMKSoNjDqh7O0KflCu/qQ==
X-Received: by 2002:a25:7395:: with SMTP id o143mr4692408ybc.435.1581719474152;
        Fri, 14 Feb 2020 14:31:14 -0800 (PST)
Received: from xps15 (S0106002369de4dac.cg.shawcable.net. [68.147.8.254])
        by smtp.gmail.com with ESMTPSA id d22sm3096795ywb.77.2020.02.14.14.31.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Feb 2020 14:31:13 -0800 (PST)
Date:   Fri, 14 Feb 2020 15:31:11 -0700
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     Mike Leach <mike.leach@linaro.org>
Cc:     linux-arm-kernel@lists.infradead.org, coresight@lists.linaro.org,
        linux-doc@vger.kernel.org, suzuki.poulose@arm.com
Subject: Re: [PATCH v4 4/6] coresight: Expose device connections via sysfs
Message-ID: <20200214223111.GA20024@xps15>
References: <20200211105808.27884-1-mike.leach@linaro.org>
 <20200211105808.27884-5-mike.leach@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200211105808.27884-5-mike.leach@linaro.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hi Mike,

On Tue, Feb 11, 2020 at 10:58:06AM +0000, Mike Leach wrote:
> From: Suzuki K Poulose <suzuki.poulose@arm.com>
> 
> Coresight device connections are a bit complicated and is not
> exposed currently to the user. One has to look at the platform
> descriptions (DT bindings or ACPI bindings) to make an understanding.
> Given the new naming scheme, it will be helpful to have this information
> to choose the appropriate devices for tracing. This patch exposes
> the device connections via links in the sysfs directories.
> 
> e.g, for a connection devA[OutputPort_X] -> devB[InputPort_Y]
> is represented as two symlinks:
> 
>   /sys/bus/coresight/.../devA/out:X -> /sys/bus/coresight/.../devB
>   /sys/bus/coresight/.../devB/in:Y  -> /sys/bus/coresight/.../devA
> 
> Cc: Mathieu Poirier <mathieu.poirier@linaro.org>
> Signed-off-by: Suzuki K Poulose <suzuki.poulose@arm.com>
> 
> Revised to use the generic sysfs links functions & link structures.
> Provides a connections sysfs group to hold the links.
> 
> Co-developed-by: Mike Leach <mike.leach@linaro.org>
> Signed-off-by: Mike Leach <mike.leach@linaro.org>

Because this patch is "From:" Suzuki, this should be:

Co-developed-by: Suzuki K Poulose <suzuki.poulose@arm.com>
Signed-off-by: Mike Leach <mike.leach@linaro.org>

You can expand on Suzuki's contribution or the modifications you've done to it
in the changelog.

With the above:

Reviewed-by: Mathieu Poirier <mathieu.poirier@linaro.org>

> ---
>  drivers/hwtracing/coresight/coresight-priv.h  |  5 ++
>  drivers/hwtra cing/coresight/coresight-sysfs.c | 80 +++++++++++++++++++
>  drivers/hwtracing/coresight/coresight.c       | 46 ++++++++---
>  include/linux/coresight.h                     |  2 +
>  4 files changed, 121 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/hwtracing/coresight/coresight-priv.h b/drivers/hwtracing/coresight/coresight-priv.h
> index a4a658d46045..5a36f0f50899 100644
> --- a/drivers/hwtracing/coresight/coresight-priv.h
> +++ b/drivers/hwtracing/coresight/coresight-priv.h
> @@ -157,6 +157,11 @@ int coresight_add_sysfs_link(struct coresight_sysfs_link *info);
>  void coresight_remove_sysfs_link(struct coresight_sysfs_link *info);
>  int coresight_create_conns_sysfs_group(struct coresight_device *csdev);
>  void coresight_remove_conns_sysfs_group(struct coresight_device *csdev);
> +int coresight_make_links(struct coresight_device *orig,
> +			 struct coresight_connection *conn,
> +			 struct coresight_device *target);
> +void coresight_remove_links(struct coresight_device *orig,
> +			    struct coresight_connection *conn);
>  
>  #ifdef CONFIG_CORESIGHT_SOURCE_ETM3X
>  extern int etm_readl_cp14(u32 off, unsigned int *val);
> diff --git a/drivers/hwtracing/coresight/coresight-sysfs.c b/drivers/hwtracing/coresight/coresight-sysfs.c
> index 17d565941e5e..0f18332b9f19 100644
> --- a/drivers/hwtracing/coresight/coresight-sysfs.c
> +++ b/drivers/hwtracing/coresight/coresight-sysfs.c
> @@ -122,3 +122,83 @@ void coresight_remove_sysfs_link(struct coresight_sysfs_link *info)
>  	info->orig->nr_links--;
>  	info->target->nr_links--;
>  }
> +
> +/*
> + * coresight_make_links: Make a link for a connection from a @orig
> + * device to @target, represented by @conn.
> + *
> + *   e.g, for devOrig[output_X] -> devTarget[input_Y] is represented
> + *   as two symbolic links :
> + *
> + *	/sys/.../devOrig/out:X	-> /sys/.../devTarget/
> + *	/sys/.../devTarget/in:Y	-> /sys/.../devOrig/
> + *
> + * The link names are allocated for a device where it appears. i.e, the
> + * "out" link on the master and "in" link on the slave device.
> + * The link info is stored in the connection record for avoiding
> + * the reconstruction of names for removal.
> + */
> +int coresight_make_links(struct coresight_device *orig,
> +			 struct coresight_connection *conn,
> +			 struct coresight_device *target)
> +{
> +	int ret = -ENOMEM;
> +	char *outs = NULL, *ins = NULL;
> +	struct coresight_sysfs_link *link = NULL;
> +
> +	do {
> +		outs = devm_kasprintf(&orig->dev, GFP_KERNEL,
> +				      "out:%d", conn->outport);
> +		if (!outs)
> +			break;
> +		ins = devm_kasprintf(&target->dev, GFP_KERNEL,
> +				     "in:%d", conn->child_port);
> +		if (!ins)
> +			break;
> +		link = devm_kzalloc(&orig->dev,
> +				    sizeof(struct coresight_sysfs_link),
> +				    GFP_KERNEL);
> +		if (!link)
> +			break;
> +
> +		link->orig = orig;
> +		link->target = target;
> +		link->orig_name = outs;
> +		link->target_name = ins;
> +
> +		ret = coresight_add_sysfs_link(link);
> +		if (ret)
> +			break;
> +
> +		conn->link = link;
> +
> +		/*
> +		 * Install the device connection. This also indicates that
> +		 * the links are operational on both ends.
> +		 */
> +		conn->child_dev = target;
> +		return 0;
> +	} while (0);
> +
> +	return ret;
> +}
> +
> +/*
> + * coresight_remove_links: Remove the sysfs links for a given connection @conn,
> + * from @orig device to @target device. See coresight_make_links() for more
> + * details.
> + */
> +void coresight_remove_links(struct coresight_device *orig,
> +			    struct coresight_connection *conn)
> +{
> +	if (!orig || !conn->link)
> +		return;
> +
> +	coresight_remove_sysfs_link(conn->link);
> +
> +	devm_kfree(&conn->child_dev->dev, conn->link->target_name);
> +	devm_kfree(&orig->dev, conn->link->orig_name);
> +	devm_kfree(&orig->dev, conn->link);
> +	conn->link = NULL;
> +	conn->child_dev = NULL;
> +}
> diff --git a/drivers/hwtracing/coresight/coresight.c b/drivers/hwtracing/coresight/coresight.c
> index 07f66a3968f1..4f10cfa9dc18 100644
> --- a/drivers/hwtracing/coresight/coresight.c
> +++ b/drivers/hwtracing/coresight/coresight.c
> @@ -1031,7 +1031,7 @@ static void coresight_device_release(struct device *dev)
>  
>  static int coresight_orphan_match(struct device *dev, void *data)
>  {
> -	int i;
> +	int i, ret = 0;
>  	bool still_orphan = false;
>  	struct coresight_device *csdev, *i_csdev;
>  	struct coresight_connection *conn;
> @@ -1056,19 +1056,23 @@ static int coresight_orphan_match(struct device *dev, void *data)
>  		/* We have found at least one orphan connection */
>  		if (conn->child_dev == NULL) {
>  			/* Does it match this newly added device? */
> -			if (conn->child_fwnode == csdev->dev.fwnode)
> -				conn->child_dev = csdev;
> -			else
> +			if (conn->child_fwnode == csdev->dev.fwnode) {
> +				ret = coresight_make_links(i_csdev,
> +							   conn, csdev);
> +				if (ret)
> +					return ret;
> +			} else {
>  				/* This component still has an orphan */
>  				still_orphan = true;
> +			}
>  		}
>  	}
>  
>  	i_csdev->orphan = still_orphan;
>  
>  	/*
> -	 * Returning '0' ensures that all known component on the
> -	 * bus will be checked.
> +	 * Returning '0' in case we didn't encounter any error,
> +	 * ensures that all known component on the bus will be checked.
>  	 */
>  	return 0;
>  }
> @@ -1082,15 +1086,21 @@ static int coresight_fixup_orphan_conns(struct coresight_device *csdev)
>  
>  static int coresight_fixup_device_conns(struct coresight_device *csdev)
>  {
> -	int i;
> +	int i, ret = 0;
>  
>  	for (i = 0; i < csdev->pdata->nr_outport; i++) {
>  		struct coresight_connection *conn = &csdev->pdata->conns[i];
>  
>  		conn->child_dev =
>  			coresight_find_csdev_by_fwnode(conn->child_fwnode);
> -		if (!conn->child_dev)
> +		if (conn->child_dev) {
> +			ret = coresight_make_links(csdev, conn,
> +						   conn->child_dev);
> +			if (ret)
> +				break;
> +		} else {
>  			csdev->orphan = true;
> +		}
>  	}
>  
>  	return 0;
> @@ -1121,7 +1131,7 @@ static int coresight_remove_match(struct device *dev, void *data)
>  
>  		if (csdev->dev.fwnode == conn->child_fwnode) {
>  			iterator->orphan = true;
> -			conn->child_dev = NULL;
> +			coresight_remove_links(iterator, conn);
>  			/*
>  			 * Drop the reference to the handle for the remote
>  			 * device acquired in parsing the connections from
> @@ -1215,13 +1225,23 @@ void coresight_release_platform_data(struct coresight_device *csdev,
>  				     struct coresight_platform_data *pdata)
>  {
>  	int i;
> +	struct coresight_connection *conns = pdata->conns;
>  
>  	for (i = 0; i < pdata->nr_outport; i++) {
> -		if (pdata->conns[i].child_fwnode) {
> -			fwnode_handle_put(pdata->conns[i].child_fwnode);
> +		/* If we have made the links, remove them now */
> +		if (csdev && conns[i].child_dev)
> +			coresight_remove_links(csdev, &conns[i]);
> +		/*
> +		 * Drop the refcount and clear the handle as this device
> +		 * is going away
> +		 */
> +		if (conns[i].child_fwnode) {
> +			fwnode_handle_put(conns[i].child_fwnode);
>  			pdata->conns[i].child_fwnode = NULL;
>  		}
>  	}
> +	if (csdev)
> +		coresight_remove_conns_sysfs_group(csdev);
>  }
>  
>  struct coresight_device *coresight_register(struct coresight_desc *desc)
> @@ -1303,7 +1323,9 @@ struct coresight_device *coresight_register(struct coresight_desc *desc)
>  
>  	mutex_lock(&coresight_mutex);
>  
> -	ret = coresight_fixup_device_conns(csdev);
> +	ret = coresight_create_conns_sysfs_group(csdev);
> +	if (!ret)
> +		ret = coresight_fixup_device_conns(csdev);
>  	if (!ret)
>  		ret = coresight_fixup_orphan_conns(csdev);
>  	if (!ret)
> diff --git a/include/linux/coresight.h b/include/linux/coresight.h
> index a2ec25e02ca9..ccd17304d7bd 100644
> --- a/include/linux/coresight.h
> +++ b/include/linux/coresight.h
> @@ -140,12 +140,14 @@ struct coresight_desc {
>   * @chid_fwnode: remote component's fwnode handle.
>   * @child_dev:	a @coresight_device representation of the component
>  		connected to @outport.
> + * @link: Representation of the connection as a sysfs link.
>   */
>  struct coresight_connection {
>  	int outport;
>  	int child_port;
>  	struct fwnode_handle *child_fwnode;
>  	struct coresight_device *child_dev;
> +	struct coresight_sysfs_link *link;
>  };
>  
>  /**
> -- 
> 2.17.1
> 
