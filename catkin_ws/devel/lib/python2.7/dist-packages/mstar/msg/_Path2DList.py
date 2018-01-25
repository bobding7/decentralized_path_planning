# This Python file uses the following encoding: utf-8
"""autogenerated by genpy from mstar/Path2DList.msg. Do not edit."""
import sys
python3 = True if sys.hexversion > 0x03000000 else False
import genpy
import struct

import mstar.msg

class Path2DList(genpy.Message):
  _md5sum = "9005d07d346652d95a7610b95384ffb2"
  _type = "mstar/Path2DList"
  _has_header = False #flag to mark the presence of a Header object
  _full_text = """Path2D[] path_list

================================================================================
MSG: mstar/Path2D
Pose2D[] poses

================================================================================
MSG: mstar/Pose2D
float32 x
float32 y
float32 yaw
"""
  __slots__ = ['path_list']
  _slot_types = ['mstar/Path2D[]']

  def __init__(self, *args, **kwds):
    """
    Constructor. Any message fields that are implicitly/explicitly
    set to None will be assigned a default value. The recommend
    use is keyword arguments as this is more robust to future message
    changes.  You cannot mix in-order arguments and keyword arguments.

    The available fields are:
       path_list

    :param args: complete set of field values, in .msg order
    :param kwds: use keyword arguments corresponding to message field names
    to set specific fields.
    """
    if args or kwds:
      super(Path2DList, self).__init__(*args, **kwds)
      #message fields cannot be None, assign default values for those that are
      if self.path_list is None:
        self.path_list = []
    else:
      self.path_list = []

  def _get_types(self):
    """
    internal API method
    """
    return self._slot_types

  def serialize(self, buff):
    """
    serialize message into buffer
    :param buff: buffer, ``StringIO``
    """
    try:
      length = len(self.path_list)
      buff.write(_struct_I.pack(length))
      for val1 in self.path_list:
        length = len(val1.poses)
        buff.write(_struct_I.pack(length))
        for val2 in val1.poses:
          _x = val2
          buff.write(_struct_3f.pack(_x.x, _x.y, _x.yaw))
    except struct.error as se: self._check_types(struct.error("%s: '%s' when writing '%s'" % (type(se), str(se), str(locals().get('_x', self)))))
    except TypeError as te: self._check_types(ValueError("%s: '%s' when writing '%s'" % (type(te), str(te), str(locals().get('_x', self)))))

  def deserialize(self, str):
    """
    unpack serialized message in str into this message instance
    :param str: byte array of serialized message, ``str``
    """
    try:
      if self.path_list is None:
        self.path_list = None
      end = 0
      start = end
      end += 4
      (length,) = _struct_I.unpack(str[start:end])
      self.path_list = []
      for i in range(0, length):
        val1 = mstar.msg.Path2D()
        start = end
        end += 4
        (length,) = _struct_I.unpack(str[start:end])
        val1.poses = []
        for i in range(0, length):
          val2 = mstar.msg.Pose2D()
          _x = val2
          start = end
          end += 12
          (_x.x, _x.y, _x.yaw,) = _struct_3f.unpack(str[start:end])
          val1.poses.append(val2)
        self.path_list.append(val1)
      return self
    except struct.error as e:
      raise genpy.DeserializationError(e) #most likely buffer underfill


  def serialize_numpy(self, buff, numpy):
    """
    serialize message with numpy array types into buffer
    :param buff: buffer, ``StringIO``
    :param numpy: numpy python module
    """
    try:
      length = len(self.path_list)
      buff.write(_struct_I.pack(length))
      for val1 in self.path_list:
        length = len(val1.poses)
        buff.write(_struct_I.pack(length))
        for val2 in val1.poses:
          _x = val2
          buff.write(_struct_3f.pack(_x.x, _x.y, _x.yaw))
    except struct.error as se: self._check_types(struct.error("%s: '%s' when writing '%s'" % (type(se), str(se), str(locals().get('_x', self)))))
    except TypeError as te: self._check_types(ValueError("%s: '%s' when writing '%s'" % (type(te), str(te), str(locals().get('_x', self)))))

  def deserialize_numpy(self, str, numpy):
    """
    unpack serialized message in str into this message instance using numpy for array types
    :param str: byte array of serialized message, ``str``
    :param numpy: numpy python module
    """
    try:
      if self.path_list is None:
        self.path_list = None
      end = 0
      start = end
      end += 4
      (length,) = _struct_I.unpack(str[start:end])
      self.path_list = []
      for i in range(0, length):
        val1 = mstar.msg.Path2D()
        start = end
        end += 4
        (length,) = _struct_I.unpack(str[start:end])
        val1.poses = []
        for i in range(0, length):
          val2 = mstar.msg.Pose2D()
          _x = val2
          start = end
          end += 12
          (_x.x, _x.y, _x.yaw,) = _struct_3f.unpack(str[start:end])
          val1.poses.append(val2)
        self.path_list.append(val1)
      return self
    except struct.error as e:
      raise genpy.DeserializationError(e) #most likely buffer underfill

_struct_I = genpy.struct_I
_struct_3f = struct.Struct("<3f")
