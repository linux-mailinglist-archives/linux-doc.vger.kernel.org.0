Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8F6826B794A
	for <lists+linux-doc@lfdr.de>; Mon, 13 Mar 2023 14:45:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230038AbjCMNpI (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Mon, 13 Mar 2023 09:45:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44436 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230252AbjCMNov (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 13 Mar 2023 09:44:51 -0400
Received: from madras.collabora.co.uk (madras.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E9E1C58C2B;
        Mon, 13 Mar 2023 06:44:48 -0700 (PDT)
Received: from [192.168.0.192] (unknown [194.146.248.75])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: andrzej.p)
        by madras.collabora.co.uk (Postfix) with ESMTPSA id AFB81660037C;
        Mon, 13 Mar 2023 13:44:46 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
        s=mail; t=1678715087;
        bh=gGpTmT3fEqRln73YrvkUsmUPbkNfk0B34SvnPIYi1Wk=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=FWsOXcB1yIKmbYd/o+yoFgJzwVjou2p/ffXdqoq44lyW2hH4XSKpUOvk8w7ZC6Vsz
         8qQnDfmVyhXyTOWFSmkryweV267fM9MPH0DPAE/os8pwCu52zTt0RhUSzOxsTaiJie
         tJsn4VNLrTwIJ6oxZq7ov4vZssxc40HF2IZmYWbFFfF3KKcdT8eX4yfUUig3xPZxV2
         JRDv6rVXV3k+6qbQx2F0UB7teOY/129pU3YO2Y40er36u63B9+ahHSx1JRC0L5ofAG
         wm95Ea6hinBeqEAIk70k8haeKcGNHAbsI/ZwFwnxQNGSvycq6VH4rtJiwjM8nkL7GZ
         Kfiw4SmzLAHKA==
Message-ID: <3c7af6f9-2990-fd74-a4bd-b9432e7cf259@collabora.com>
Date:   Mon, 13 Mar 2023 14:44:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH] docs: usb: Add documentation for the UVC Gadget
To:     Daniel Scally <dan.scally@ideasonboard.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jonathan Corbet <corbet@lwn.net>, linux-usb@vger.kernel.org,
        linux-doc@vger.kernel.org
Cc:     laurent.pinchart@ideasonboard.com
References: <20230308165213.139315-1-dan.scally@ideasonboard.com>
Content-Language: en-US
From:   Andrzej Pietrasiewicz <andrzej.p@collabora.com>
In-Reply-To: <20230308165213.139315-1-dan.scally@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hi Daniel,

I found two typos, indicated below,

Other than that

Reviewed-by: Andrzej Pietrasiewicz <andrzej.p@collabora.com>

W dniu 8.03.2023 o 17:52, Daniel Scally pisze:
> The UVC Gadget function has become quite complex, but documentation
> for it is fairly sparse. Add some more detailed documentation to
> improve the situation.
> 
> Signed-off-by: Daniel Scally <dan.scally@ideasonboard.com>
> ---
> Greg, Jonathan - I didn't know if there's a specific tree for Documentation/
> only patches, so this is on usb-next. If that was wrong let me know and I'll
> resend the patch.
> 
>   Documentation/usb/gadget_uvc.rst | 352 +++++++++++++++++++++++++++++++
>   Documentation/usb/index.rst      |   1 +
>   2 files changed, 353 insertions(+)
>   create mode 100644 Documentation/usb/gadget_uvc.rst
> 
> diff --git a/Documentation/usb/gadget_uvc.rst b/Documentation/usb/gadget_uvc.rst
> new file mode 100644
> index 000000000000..6d22faceb1a0
> --- /dev/null
> +++ b/Documentation/usb/gadget_uvc.rst
> @@ -0,0 +1,352 @@
> +=======================
> +Linux UVC Gadget Driver
> +=======================
> +
> +Overview
> +--------
> +The UVC Gadget driver is a driver for hardware on the *device* side of a USB
> +connection. It is intended to run on a Linux system that has USB device-side
> +hardware such as boards with an OTG port.
> +
> +On the device system, once the driver is bound it appears as a V4L2 device with
> +the output capability.
> +
> +On the host side (once connected via USB cable), a device running the UVC Gadget
> +driver *and controlled by an appropriate userspace program* should appear as a UVC
> +specification compliant camera, and function appropriately with any program
> +designed to handle them. The userspace program running on the device system can
> +queue image buffers from a variety of sources to be transmitted via the USB
> +connection. Typically this would mean forwarding the buffers from a camera sensor
> +peripheral, but the source of the buffer is entirely dependent on the userspace
> +companion program.
> +
> +Configuring the device kernel
> +-----------------------------
> +The Kconfig options USB_CONFIGFS, USB_LIBCOMPOSITE, USB_CONFIGFS_F_UVC and
> +USB_F_UVC must be selected to enable support for the UVC gadget.
> +
> +Configuring the gadget through configfs
> +---------------------------------------
> +The UVC Gadget expects to be configured through configfs using the UVC function.
> +This allows a significant degree of flexibility, as many of a UVC device's
> +settings can be controlled this way.
> +
> +Not all of the available attributes are described here. For a complete enumeration
> +see Documentation/ABI/testing/configfs-usb-gadget-uvc
> +
> +Assumptions
> +~~~~~~~~~~~
> +This section assumes that you have mounted configfs at `/sys/kernel/config` and
> +created a gadget as `/sys/kernel/config/usb_gadget/g1`.
> +
> +The UVC Function
> +~~~~~~~~~~~~~~~~
> +
> +The first step is to create the UVC function:
> +
> +.. code-block:: bash
> +
> +	# These variables will be assumed throughout the rest of the document
> +	CONFIGFS="/sys/kernel/config"
> +	GADGET="$CONFIGFS/usb_gadget/g1"
> +	FUNCTION="$GADGET/functions/uvc.0"
> +
> +	mkdir -p $FUNCTION
> +
> +Formats and Frames
> +~~~~~~~~~~~~~~~~~~
> +
> +You must configure the gadget by telling it which formats you support, as well
> +as the frame sizes and frame intervals that are supported for each format. In
> +the current implementation there is no way for the gadget to refuse to set a
> +format that the host instructs it to set, so it is important that this step is
> +completed *accurately* to ensure that the host never asks for a format that
> +can't be provided.
> +
> +Formats are created under the streaming/uncompressed and streaming/mjpeg configfs
> +groups, with the framesizes created under the formats in the following
> +structure:
> +
> +::
> +
> +	uvc.0 +
> +	      |
> +	      + streaming +
> +			  |
> +			  + mjpeg +
> +			  |       |
> +			  |       + mjpeg +
> +			  |	       |
> +			  |	       + 720p
> +			  |	       |
> +			  |	       + 1080p
> +			  |
> +			  + uncompressed +
> +					 |
> +					 + yuyv +
> +						|
> +						+ 720p
> +						|
> +						+ 1080p
> +
> +Each frame can then be configured with a width and height, plus the maximum
> +buffer size required to store a single frame, and finally with the supported
> +frame intervals for that format and framesize. Width and height are enumerated in
> +units of pixels, frame interval in units of 100ns. To create the structure
> +above with 2, 15 and 100 fps frameintervals for each framesize for example you
> +might do:
> +
> +.. code-block:: bash
> +
> +	create_frame() {
> +		# Example usage:
> +		# create_frame <width> <height> <group> <format name>
> +
> +		WIDTH=$1
> +		HEIGHT=$2
> +		FORMAT=$3
> +		NAME=$4
> +
> +		wdir=$FUNCTION/streaming/$FORMAT/$NAME/${HEIGHT}p
> +
> +		mkdir -p $wdir
> +		echo $WIDTH > $wdir/wWidth
> +		echo $HEIGHT > $wdir/wHeight
> +		echo $(( $WIDTH * $HEIGHT * 2 )) > $wdir/dwMaxVideoFrameBufferSize
> +		cat <<EOF > $wdir/dwFrameInterval
> +	666666
> +	100000
> +	5000000
> +	EOF
> +	}
> +
> +	create_frame 1280 720 mjpeg mjpeg
> +	create_frame 1920 1080 mjpeg mjpeg
> +	create_frame 1280 720 uncompressed yuyv
> +	create_frame 1920 1080 uncompressed yuyv
> +
> +The only uncompressed format currently supported is YUYV, which is detailed at
> +Documentation/userspace-api/media/v4l/pixfmt-packed.yuv.rst.
> +
> +Color Matching Descriptors
> +~~~~~~~~~~~~~~~~~~~~~~~~~~
> +It's possible to specify some colometry information for each format you create.

did you mean

s/colometry/colorimetry/

> +This step is optional, and default information will be included if this step is
> +skipped; those default values follow those defined in the Color Matching Descriptor
> +section of the UVC specification.
> +
> +To create a Color Matching Descriptor, create a configfs item and set its three
> +attributes to your desired settings and then link to it from the format you wish
> +it to be associated with:
> +
> +.. code-block:: bash
> +
> +	# Create a new Color Matching Descriptor
> +
> +	mkdir $FUNCTION/streaming/color_matching/yuyv
> +	pushd $FUNCTION/streaming/color_matching/yuyv
> +
> +	echo 1 > bColorPrimaries
> +	echo 1 > bTransferCharacteristics
> +	echo 4 > bMatrixCoefficients
> +
> +	popd
> +
> +	# Create a symlink to the Color Matching Descriptor from the format's config item
> +	ln -s $FUNCTION/streaming/color_matching/yuyv $FUNCTION/streaming/uncompressed/yuyv
> +
> +For details about the valid values, consult the UVC specification. Note that a
> +default color matching descriptor exists and is used by any format which does
> +not have a link to a different Color Matching Descriptor. It's possible to
> +change the attribute settings for the default descriptor, so bear in mind that if
> +you do that you are altering the defaults for any format that does not link to
> +a different one.
> +
> +
> +Header linking
> +~~~~~~~~~~~~~~
> +
> +The UVC specification requires that Format and Frame descriptors be preceded by
> +Headers detailing things such as the number and cumulative size of the different
> +Format descriptors that follow. This and similar operations are acheived in

s/acheived/achieved

> +configfs by linking between the configfs item representing the header and the
> +config items representing those other descriptors, in this manner:
> +
> +.. code-block:: bash
> +
> +	mkdir $FUNCTION/streaming/header/h
> +
> +	# This section links the format descriptors and their associated frames
> +	# to the header
> +	cd $FUNCTION/streaming/header/h
> +	ln -s ../../uncompressed/yuyv
> +	ln -s ../../mjpeg/mjpeg
> +
> +	# This section ensures that the header will be transmitted for each
> +	# speed's set of descriptors. If support for a particular speed is not
> +	# needed then it can be skipped here.
> +	cd ../../class/fs
> +	ln -s ../../header/h
> +	cd ../../class/hs
> +	ln -s ../../header/h
> +	cd ../../class/ss
> +	ln -s ../../header/h
> +	cd ../../../control
> +	mkdir header/h
> +	ln -s header/h class/fs
> +	ln -s header/h class/ss
> +
> +
> +Extension Unit Support
> +~~~~~~~~~~~~~~~~~~~~~~
> +
> +A UVC Extension Unit (XU) basically provides a distinct unit to which control set
> +and get requests can be addressed. The meaning of those control requests is
> +entirely implementation dependent, but may be used to control settings outside
> +of the UVC specification (for example enabling or disabling video effects). An
> +XU can be inserted into the UVC unit chain or left free-hanging.
> +
> +Configuring an extension unit involves creating an entry in the appropriate
> +directory and setting its attributes appropriately, like so:
> +
> +.. code-block:: bash
> +
> +	mkdir $FUNCTION/control/extensions/xu.0
> +	pushd $FUNCTION/control/extensions/xu.0
> +
> +	# Set the bUnitID of the Processing Unit as the source for this
> +	# Extension Unit
> +	echo 2 > baSourceID
> +
> +	# Set this XU as the source of the default output terminal. This inserts
> +	# the XU into the UVC chain between the PU and OT such that the final
> +	# chain is IT > PU > XU.0 > OT
> +	cat bUnitID > ../../terminal/output/default/baSourceID
> +
> +	# Flag some controls as being available for use. The bmControl field is
> +	# a bitmap with each bit denoting the availability of a particular
> +	# control. For example to flag the 0th, 2nd and 3rd controls available:
> +	echo 0x0d > bmControls
> +
> +	# Set the GUID; this is a vendor-specific code identifying the XU.
> +	echo -e -n "\x01\x02\x03\x04\x05\x06\x07\x08\x09\x0a\x0b\x0c\x0d\x0e\x0f\x10" > guidExtensionCode
> +
> +	popd
> +
> +The bmControls attribute and the baSourceID attribute are multi-value attributes.
> +This means that you may write multiple newline separated values to them. For
> +example to flag the 1st, 2nd, 9th and 10th controls as being available you would
> +need to write two values to bmControls, like so:
> +
> +.. code-block:: bash
> +
> +	cat << EOF > bmControls
> +	0x03
> +	0x03
> +	EOF
> +
> +The multi-value nature of the baSourceID attribute belies the fact that XUs can
> +be multiple-input, though note that this currently has no significant effect.
> +
> +The bControlSize attribute reflects the size of the bmControls attribute, and
> +similarly bNrInPins reflects the size of the baSourceID attributes. Both
> +attributes are automatically increased / decreased as you set bmControls and
> +baSourceID. It is also possible to manually increase or decrease bControlSize
> +which has the effect of truncating entries to the new size, or padding entries
> +out with 0x00, for example:
> +
> +::
> +
> +	$ cat bmControls
> +	0x03
> +	0x05
> +
> +	$ cat bControlSize
> +	2
> +
> +	$ echo 1 > bControlSize
> +	$ cat bmControls
> +	0x03
> +
> +	$ echo 2 > bControlSize
> +	$ cat bmControls
> +	0x03
> +	0x00
> +
> +bNrInPins and baSourceID function in the same way.
> +
> +Custom Strings Support
> +~~~~~~~~~~~~~~~~~~~~~~
> +
> +String descriptors that provide a textual description for various parts of a
> +USB device can be defined in the usual place within USB configfs, and may then
> +be linked to from the UVC function root or from Extension Unit directories to
> +assign those strings as descriptors:
> +
> +.. code-block:: bash
> +
> +	# Create a string descriptor in us-EN and link to it from the function
> +	# root. The name of the link is significant here, as it declares this
> +	# descriptor to be intended for the Interface Association Descriptor.
> +	# Other significant link names at function root are vs0_desc and vs1_desc
> +	# For the VideoStreaming Interface 0/1 Descriptors.
> +
> +	mkdir -p $GADGET/strings/0x409/iad_desc
> +	echo -n "Interface Associaton Descriptor" > $GADGET/strings/0x409/iad_desc/s
> +	ln -s $GADGET/strings/0x409/iad_desc $FUNCTION/iad_desc
> +
> +	# Because the link to a String Descriptor from an Extension Unit clearly
> +	# associates the two, the name of this link is not significant and may
> +	# be set freely.
> +
> +	mkdir -p $GADGET/strings/0x409/xu.0
> +	echo -n "A Very Useful Extension Unit" > $GADGET/strings/0x409/xu.0/s
> +	ln -s $GADGET/strings/0x409/xu.0 $FUNCTION/control/extensions/xu.0
> +
> +The interrupt endpoint
> +~~~~~~~~~~~~~~~~~~~~~~
> +
> +The VideoControl interface has an optional interrupt endpoint which is by default
> +disabled. This is intended to support delayed response control set requests for
> +UVC (which should respond through the interrupt endpoint rather than tying up
> +endpoint 0). At present support for sending data through this endpoint is missing
> +and so it is left disabled to avoid confusion. If you wish to enable it you can
> +do so through the configfs attribute:
> +
> +.. code-block:: bash
> +
> +	echo 1 > $FUNCTION/control/enable_interrupt_ep
> +
> +Bandwidth configuration
> +~~~~~~~~~~~~~~~~~~~~~~~
> +
> +There are three attributes which control the bandwidth of the USB connection.
> +These live in the function root and can be set within limits:
> +
> +.. code-block:: bash
> +
> +	# streaming_interval sets bInterval. Values range from 1..255
> +	echo 1 > $FUNCTION/streaming_interval
> +
> +	# streaming_maxpacket sets wMaxPacketSize. Valid values are 1024/2048/3072
> +	echo 3072 > $FUNCTION/streaming_maxpacket
> +
> +	# streaming_maxburst sets bMaxBurst. Valid values are 1..15
> +	echo 1 > $FUNCTION/streaming_maxburst
> +
> +
> +The values passed here will be clamped to valid values according to the UVC
> +specification (which depend on the speed of the USB connection). To understand
> +how the settings influence bandwidth you should consult the UVC specifications,
> +but a rule of thumb is that increasing the streaming_maxpacket setting will
> +improve bandwidth (and thus the maximum possible framerate), whilst the same is
> +true for streaming_maxburst provided the USB connection is running at SuperSpeed.
> +Increasing streaming_interval will reduce bandwidth and framerate.
> +
> +The userspace application
> +-------------------------
> +By itself, the UVC Gadget driver cannot do anything particularly interesting. It
> +must be paired with a userspace program that responds to UVC control requests and
> +fills buffers to be queued to the V4L2 device that the driver creates. How those
> +things are achieved is implementation dependent and beyond the scope of this
> +document, but a reference application can be found at https://gitlab.freedesktop.org/camera/uvc-gadget
> diff --git a/Documentation/usb/index.rst b/Documentation/usb/index.rst
> index b656c9be23ed..27955dad95e1 100644
> --- a/Documentation/usb/index.rst
> +++ b/Documentation/usb/index.rst
> @@ -16,6 +16,7 @@ USB support
>       gadget_multi
>       gadget_printer
>       gadget_serial
> +    gadget_uvc
>       gadget-testing
>       iuu_phoenix
>       mass-storage

