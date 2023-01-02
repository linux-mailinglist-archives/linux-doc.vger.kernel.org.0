Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EC4F765B242
	for <lists+linux-doc@lfdr.de>; Mon,  2 Jan 2023 13:44:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232468AbjABMo1 (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Mon, 2 Jan 2023 07:44:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50904 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229494AbjABMo0 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 2 Jan 2023 07:44:26 -0500
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A4AA05FE0;
        Mon,  2 Jan 2023 04:44:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1672663464; x=1704199464;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ioVYIpFG8DC6v6ZQ/LA0HIv3ZhntmZW8xS8Dwp6vcB4=;
  b=jR+wKcWlWSjlbQJYqLgQYrEQVS/zhH5PaH6Vp9i67lsocR8zpej2v11i
   DP7B9hSg5sjA+iSdcVezEU6U4hp6HSF5a/6LdMPYrnBWJVnFZ0+F7X7Xp
   YF4MbOBTJ3h+EvZdYKtiX/mya7sQE361c+GXLof1qsn2vaxG9Ii8Tax6I
   YYlgj/FzUaE0GaXLnKZ7g4b6Yi0ZTu7qC6SJ2D5tNx448mYRbz5ReAqKC
   2iVn/wL+hBBLkiUoPhPgI1VYH0P98FUQKogmsxq43rz93H6F/+QARgWOS
   YzkGWYPRIJ6vAyeuMA+HntabzysMAxemwOmNDKgWZ1Y9pSBuN54iFpfrV
   A==;
X-IronPort-AV: E=Sophos;i="5.96,294,1665439200"; 
   d="scan'208";a="28204263"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
  by mx1-pgp.tq-group.com with ESMTP; 02 Jan 2023 13:44:21 +0100
Received: from mx1.tq-group.com ([192.168.6.7])
  by tq-pgp-pr1.tq-net.de (PGP Universal service);
  Mon, 02 Jan 2023 13:44:21 +0100
X-PGP-Universal: processed;
        by tq-pgp-pr1.tq-net.de on Mon, 02 Jan 2023 13:44:21 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1672663461; x=1704199461;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ioVYIpFG8DC6v6ZQ/LA0HIv3ZhntmZW8xS8Dwp6vcB4=;
  b=R2nkheNI3fJ58pMHLE41u24BQONdzetUJ29PCXdIwLv0mzar1jCWEosY
   m2BserLigf+MQx7FAPWMFj3ivGGgq/C7cv+PZ7rnOe8H6J0rrsX0TSPw+
   7lCTkcMG8yLdT64gHJQ7PzPMT1EwOXF/6qCwq+AB7t3Hwm+NLywxEoBfR
   mYQzBSnxcSMffBgs56AodHh1RhKeuX+O8/+yoHfwkIAvp/e0vUETDz4aw
   95hY4o4dy2ylT+iWPj825Z+Xd6a5pgYWssWAe5kut1yD5SBscGQ/Ai5nr
   PzLrM30/Meyu1HVJ+QtA1v/suX6jTGmtzFFDgASJSJoT7kAoNLZfzj98Y
   g==;
X-IronPort-AV: E=Sophos;i="5.96,294,1665439200"; 
   d="scan'208";a="28204262"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 02 Jan 2023 13:44:21 +0100
Received: from steina-w.localnet (unknown [10.123.53.21])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id 2E201280056;
        Mon,  2 Jan 2023 13:44:21 +0100 (CET)
From:   Alexander Stein <alexander.stein@ew.tq-group.com>
To:     Christian Marangi <ansuelsmth@gmail.com>
Cc:     Andrew Lunn <andrew@lunn.ch>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Vladimir Oltean <olteanv@gmail.com>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>,
        Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Jonathan Corbet <corbet@lwn.net>, Pavel Machek <pavel@ucw.cz>,
        "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
        John Crispin <john@phrozen.org>, netdev@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-leds@vger.kernel.org,
        Tim Harvey <tharvey@gateworks.com>,
        Rasmus Villemoes <rasmus.villemoes@prevas.dk>
Subject: Re: [PATCH v7 06/11] leds: trigger: netdev: add hardware control support
Date:   Mon, 02 Jan 2023 13:44:20 +0100
Message-ID: <13186102.dW097sEU6C@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <639ca43c.050a0220.e6d91.9fe8@mx.google.com>
References: <20221214235438.30271-1-ansuelsmth@gmail.com> <3770526.R56niFO833@steina-w> <639ca43c.050a0220.e6d91.9fe8@mx.google.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Am Freitag, 16. Dezember 2022, 18:00:45 CET schrieb Christian Marangi:
> On Thu, Dec 15, 2022 at 04:27:17PM +0100, Alexander Stein wrote:
> > Hi,
> > 
> > thanks for the v7 series.
> > 
> > Am Donnerstag, 15. Dezember 2022, 00:54:33 CET schrieb Christian Marangi:
> > > Add hardware control support for the Netdev trigger.
> > > The trigger on config change will check if the requested trigger can set
> > > to blink mode using LED hardware mode and if every blink mode is
> > > supported,
> > > the trigger will enable hardware mode with the requested configuration.
> > > If there is at least one trigger that is not supported and can't run in
> > > hardware mode, then software mode will be used instead.
> > > A validation is done on every value change and on fail the old value is
> > > restored and -EINVAL is returned.
> > > 
> > > Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
> > > ---
> > > 
> > >  drivers/leds/trigger/ledtrig-netdev.c | 155 +++++++++++++++++++++++++-
> > >  1 file changed, 149 insertions(+), 6 deletions(-)
> > > 
> > > diff --git a/drivers/leds/trigger/ledtrig-netdev.c
> > > b/drivers/leds/trigger/ledtrig-netdev.c index dd63cadb896e..ed019cb5867c
> > > 100644
> > > --- a/drivers/leds/trigger/ledtrig-netdev.c
> > > +++ b/drivers/leds/trigger/ledtrig-netdev.c
> > > @@ -37,6 +37,7 @@
> > > 
> > >   */
> > >  
> > >  struct led_netdev_data {
> > > 
> > > +	enum led_blink_modes blink_mode;
> > > 
> > >  	spinlock_t lock;
> > >  	
> > >  	struct delayed_work work;
> > > 
> > > @@ -53,11 +54,105 @@ struct led_netdev_data {
> > > 
> > >  	bool carrier_link_up;
> > >  
> > >  };
> > > 
> > > +struct netdev_led_attr_detail {
> > > +	char *name;
> > > +	bool hardware_only;
> > > +	enum led_trigger_netdev_modes bit;
> > > +};
> > > +
> > > +static struct netdev_led_attr_detail attr_details[] = {
> > > +	{ .name = "link", .bit = TRIGGER_NETDEV_LINK},
> > > +	{ .name = "tx", .bit = TRIGGER_NETDEV_TX},
> > > +	{ .name = "rx", .bit = TRIGGER_NETDEV_RX},
> > > +};
> > > +
> > > +static bool validate_baseline_state(struct led_netdev_data
> > > *trigger_data)
> > > +{
> > > +	struct led_classdev *led_cdev = trigger_data->led_cdev;
> > > +	struct netdev_led_attr_detail *detail;
> > > +	u32 hw_blink_mode_supported = 0;
> > > +	bool force_sw = false;
> > > +	int i;
> > > +
> > > +	for (i = 0; i < ARRAY_SIZE(attr_details); i++) {
> > > +		detail = &attr_details[i];
> > > +
> > > +		/* Mode not active, skip */
> > > +		if (!test_bit(detail->bit, &trigger_data->mode))
> > > +			continue;
> > > +
> > > +		/* Hardware only mode enabled on software controlled led
> > 
> > */
> > 
> > > +		if (led_cdev->blink_mode == SOFTWARE_CONTROLLED &&
> > > +		    detail->hardware_only)
> > > +			return false;
> > > +
> > > +		/* Check if the mode supports hardware mode */
> > > +		if (led_cdev->blink_mode != SOFTWARE_CONTROLLED) {
> > > +			/* With a net dev set, force software mode.
> > > +			 * With modes are handled by hardware, led will
> > 
> > blink
> > 
> > > +			 * based on his own events and will ignore any
> > 
> > event
> > 
> > > +			 * from the provided dev.
> > > +			 */
> > > +			if (trigger_data->net_dev) {
> > > +				force_sw = true;
> > > +				continue;
> > > +			}
> > > +
> > > +			/* With empty dev, check if the mode is
> > 
> > supported */
> > 
> > > +			if
> > 
> > (led_trigger_blink_mode_is_supported(led_cdev, detail->bit))
> > 
> > > +				hw_blink_mode_supported |= BIT(detail-
> > >
> > >bit);
> > 
> > Shouldn't this be BIT(detail->bit)?
> 
> I think I didn't understand?

The name 'bit' indicates this is a single bit number rather than a bitmask. 
AFAICS the value (detail->bit) passed to led_trigger_blink_mode_is_supported 
is eventually used within test_bit inside dp83867_parse_netdev. I assume you 
have to actually pass the bitmask with this single bit set, not the bit number 
itself.

Best regards,
Alexander

> > > +		}
> > > +	}
> > > +
> > > +	/* We can't run modes handled by both software and hardware.
> > > +	 * Check if we run hardware modes and check if all the modes
> > > +	 * can be handled by hardware.
> > > +	 */
> > > +	if (hw_blink_mode_supported && hw_blink_mode_supported !=
> > > trigger_data->mode) +		return false;
> > > +
> > > +	/* Modes are valid. Decide now the running mode to later
> > > +	 * set the baseline.
> > > +	 * Software mode is enforced with net_dev set. With an empty
> > > +	 * one hardware mode is selected by default (if supported).
> > > +	 */
> > > +	if (force_sw || led_cdev->blink_mode == SOFTWARE_CONTROLLED)
> > 
> > IMHO '|| !hw_blink_mode_supported' should be added here for blink_modes.
> > This might happen if a PHY LED is SOFTWARE_HARDWARE_CONTROLLED, but some
> > blink mode is not supported by hardware, thus hw_blink_mode_supported=0.
> 
> Will check this and report back.
> 
> > Best regards,
> > Alexander
> > 
> > > +		trigger_data->blink_mode = SOFTWARE_CONTROLLED;
> > > +	else
> > > +		trigger_data->blink_mode = HARDWARE_CONTROLLED;
> > > +
> > > +	return true;
> > > +}
> > > +
> > > 
> > >  static void set_baseline_state(struct led_netdev_data *trigger_data)
> > >  {
> > > 
> > > +	int i;
> > > 
> > >  	int current_brightness;
> > > 
> > > +	struct netdev_led_attr_detail *detail;
> > > 
> > >  	struct led_classdev *led_cdev = trigger_data->led_cdev;
> > > 
> > > +	/* Modes already validated. Directly apply hw trigger modes */
> > > +	if (trigger_data->blink_mode == HARDWARE_CONTROLLED) {
> > > +		/* We are refreshing the blink modes. Reset them */
> > > +		led_cdev->hw_control_configure(led_cdev,
> > 
> > BIT(TRIGGER_NETDEV_LINK),
> > 
> > > +					       BLINK_MODE_ZERO);
> > > +
> > > +		for (i = 0; i < ARRAY_SIZE(attr_details); i++) {
> > > +			detail = &attr_details[i];
> > > +
> > > +			if (!test_bit(detail->bit, &trigger_data->mode))
> > > +				continue;
> > > +
> > > +			led_cdev->hw_control_configure(led_cdev,
> > 
> > BIT(detail->bit),
> > 
> > > +
> > 
> > BLINK_MODE_ENABLE);
> > 
> > Shouldn't this be BIT(detail->bit)?
> > 
> > > +		}
> > > +
> > > +		led_cdev->hw_control_start(led_cdev);
> > > +
> > > +		return;
> > > +	}
> > > +
> > > +	/* Handle trigger modes by software */
> > > 
> > >  	current_brightness = led_cdev->brightness;
> > >  	if (current_brightness)
> > >  	
> > >  		led_cdev->blink_brightness = current_brightness;
> > > 
> > > @@ -100,10 +195,15 @@ static ssize_t device_name_store(struct device
> > > *dev,
> > > 
> > >  				 size_t size)
> > >  
> > >  {
> > >  
> > >  	struct led_netdev_data *trigger_data = led_trigger_get_drvdata(dev);
> > > 
> > > +	struct net_device *old_net = trigger_data->net_dev;
> > > +	char old_device_name[IFNAMSIZ];
> > > 
> > >  	if (size >= IFNAMSIZ)
> > >  	
> > >  		return -EINVAL;
> > > 
> > > +	/* Backup old device name */
> > > +	memcpy(old_device_name, trigger_data->device_name, IFNAMSIZ);
> > > +
> > > 
> > >  	cancel_delayed_work_sync(&trigger_data->work);
> > >  	
> > >  	spin_lock_bh(&trigger_data->lock);
> > > 
> > > @@ -122,6 +222,19 @@ static ssize_t device_name_store(struct device
> > > *dev,
> > > 
> > >  		trigger_data->net_dev =
> > >  		
> > >  		    dev_get_by_name(&init_net, trigger_data->device_name);
> > > 
> > > +	if (!validate_baseline_state(trigger_data)) {
> > > +		/* Restore old net_dev and device_name */
> > > +		if (trigger_data->net_dev)
> > > +			dev_put(trigger_data->net_dev);
> > > +
> > > +		dev_hold(old_net);
> > > +		trigger_data->net_dev = old_net;
> > > +		memcpy(trigger_data->device_name, old_device_name,
> > 
> > IFNAMSIZ);
> > 
> > > +
> > > +		spin_unlock_bh(&trigger_data->lock);
> > > +		return -EINVAL;
> > > +	}
> > > +
> > > 
> > >  	trigger_data->carrier_link_up = false;
> > >  	if (trigger_data->net_dev != NULL)
> > >  	
> > >  		trigger_data->carrier_link_up =
> > 
> > netif_carrier_ok(trigger_data->net_dev);
> > 
> > > @@ -159,7 +272,7 @@ static ssize_t netdev_led_attr_store(struct device
> > > *dev, const char *buf, size_t size, enum led_trigger_netdev_modes attr)
> > > 
> > >  {
> > >  
> > >  	struct led_netdev_data *trigger_data = led_trigger_get_drvdata(dev);
> > > 
> > > -	unsigned long state;
> > > +	unsigned long state, old_mode = trigger_data->mode;
> > > 
> > >  	int ret;
> > >  	int bit;
> > > 
> > > @@ -184,6 +297,12 @@ static ssize_t netdev_led_attr_store(struct device
> > > *dev, const char *buf, else
> > > 
> > >  		clear_bit(bit, &trigger_data->mode);
> > > 
> > > +	if (!validate_baseline_state(trigger_data)) {
> > > +		/* Restore old mode on validation fail */
> > > +		trigger_data->mode = old_mode;
> > > +		return -EINVAL;
> > > +	}
> > > +
> > > 
> > >  	set_baseline_state(trigger_data);
> > >  	
> > >  	return size;
> > > 
> > > @@ -220,6 +339,8 @@ static ssize_t interval_store(struct device *dev,
> > > 
> > >  			      size_t size)
> > >  
> > >  {
> > >  
> > >  	struct led_netdev_data *trigger_data = led_trigger_get_drvdata(dev);
> > > 
> > > +	int old_interval = atomic_read(&trigger_data->interval);
> > > +	u32 old_mode = trigger_data->mode;
> > > 
> > >  	unsigned long value;
> > >  	int ret;
> > > 
> > > @@ -228,13 +349,22 @@ static ssize_t interval_store(struct device *dev,
> > > 
> > >  		return ret;
> > >  	
> > >  	/* impose some basic bounds on the timer interval */
> > > 
> > > -	if (value >= 5 && value <= 10000) {
> > > -		cancel_delayed_work_sync(&trigger_data->work);
> > > +	if (value < 5 || value > 10000)
> > > +		return -EINVAL;
> > > +
> > > +	cancel_delayed_work_sync(&trigger_data->work);
> > > +
> > > +	atomic_set(&trigger_data->interval, msecs_to_jiffies(value));
> > > 
> > > -		atomic_set(&trigger_data->interval,
> > 
> > msecs_to_jiffies(value));
> > 
> > > -		set_baseline_state(trigger_data);	/* resets timer
> > 
> > */
> > 
> > > +	if (!validate_baseline_state(trigger_data)) {
> > > +		/* Restore old interval on validation error */
> > > +		atomic_set(&trigger_data->interval, old_interval);
> > > +		trigger_data->mode = old_mode;
> > > +		return -EINVAL;
> > > 
> > >  	}
> > > 
> > > +	set_baseline_state(trigger_data);	/* resets timer */
> > > +
> > > 
> > >  	return size;
> > >  
> > >  }
> > > 
> > > @@ -368,13 +498,25 @@ static int netdev_trig_activate(struct
> > > led_classdev
> > > *led_cdev) trigger_data->mode = 0;
> > > 
> > >  	atomic_set(&trigger_data->interval, msecs_to_jiffies(50));
> > >  	trigger_data->last_activity = 0;
> > > 
> > > +	if (led_cdev->blink_mode != SOFTWARE_CONTROLLED) {
> > > +		/* With hw mode enabled reset any rule set by default */
> > > +		if (led_cdev->hw_control_status(led_cdev)) {
> > > +			rc = led_cdev->hw_control_configure(led_cdev,
> > 
> > BIT(TRIGGER_NETDEV_LINK),
> > 
> > > +
> > 
> > BLINK_MODE_ZERO);
> > 
> > > +			if (rc)
> > > +				goto err;
> > > +		}
> > > +	}
> > > 
> > >  	led_set_trigger_data(led_cdev, trigger_data);
> > >  	
> > >  	rc = register_netdevice_notifier(&trigger_data->notifier);
> > >  	if (rc)
> > > 
> > > -		kfree(trigger_data);
> > > +		goto err;
> > > 
> > > +	return 0;
> > > +err:
> > > +	kfree(trigger_data);
> > > 
> > >  	return rc;
> > >  
> > >  }
> > > 
> > > @@ -394,6 +536,7 @@ static void netdev_trig_deactivate(struct
> > > led_classdev
> > > *led_cdev)
> > > 
> > >  static struct led_trigger netdev_led_trigger = {
> > >  
> > >  	.name = "netdev",
> > > 
> > > +	.supported_blink_modes = SOFTWARE_HARDWARE,
> > > 
> > >  	.activate = netdev_trig_activate,
> > >  	.deactivate = netdev_trig_deactivate,
> > >  	.groups = netdev_trig_groups,




